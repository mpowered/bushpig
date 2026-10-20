# Bushpig

A simple Redis job queue for Rails apps.

A client puts jobs in a Redis sorted set. A server process takes them out one at a time, oldest first, and runs them.

## Requirements

- Ruby 3.2 or later to use `redis` 6 (development uses Ruby 3.3.11)
- Redis server 5.0 or later (Bushpig uses `BZPOPMIN`)
- The `redis` gem 5 or 6, and the `connection_pool` gem 2 or 3
- A Rails app with Active Record, for the server

## Installation

Bushpig is on the private gem server `gems.zero-one.io`, not on rubygems.org. The `bushpig` gem on rubygems.org is an old public release (0.1.15).

Add Bushpig to your Gemfile:

```ruby
source 'https://gems.zero-one.io/' do
  gem 'bushpig', '~> 0.1.23'
end
```

Set the gem server credentials in `BUNDLE_GEMS__ZERO___ONE__IO`, then run `bundle install`.

## Usage

### Define a job

`Bushpig::Job.job` makes a job class from a handler and a list of fields:

```ruby
ReportExport = Bushpig::Job.job(->(job) { ReportExporter.new.export(job.report_id) }, :report_id)
```

`Bushpig::Job.keyed` also takes the fields that identify the job. Jobs with the same values in these fields share one key. If you submit a keyed job while an equal one is still in the queue, the new job replaces the old one:

```ruby
CompanyUpdate = Bushpig::Job.keyed(
  ->(job) { CompanyUpdater.new.update(job) },
  %i[vat_number],
  :vat_number, :name
)
```

Bushpig stores the job as JSON, so use only field values that JSON can hold.

### Configure the client and the server

Put the configuration in an initializer. `configure_server` runs only in the `bushpig` server process. `configure_client` runs everywhere else.

```ruby
# config/initializers/bushpig.rb
redis_url = ENV.fetch('BUSHPIG_REDIS_URL')

Bushpig.configure_server do |config|
  pool          = Bushpig::RedisPool.new(size: 1, timeout: 5, redis_options: { url: redis_url, timeout: 5 })
  config.server = Bushpig::Server.new(pool) { |job| job.handle }
end

Bushpig.configure_client do |config|
  pool                      = Bushpig::RedisPool.new(size: 1, timeout: 5, redis_options: { url: redis_url })
  config.client             = Bushpig::Client.new(pool)
  config.client.default_ttl = 1.day.to_i
end
```

- `Bushpig::Server.new(pool, timeout: 2)` sets how many seconds the server waits for a job before it checks for a stop signal again. The default is 2.
- `default_ttl` sets how many seconds a job payload stays in Redis. If the server does not run a job in that time, the job expires and the server skips it. The default is no expiry.
- `Bushpig::Client.new(pool) { |job, new| ... }` runs the block after each submit. Use it for logging.

### Submit a job

```ruby
Bushpig.client.submit('company_updates', CompanyUpdate.new('4123456789', 'Acme'))
```

`submit` also takes `score:` (default: the current time, so the oldest job runs first) and `ttl:` (default: `default_ttl`).

### Run the server

Run this command from the root folder of the Rails app:

```sh
bundle exec bushpig serve company_updates
```

The server loads `config/environment.rb` and serves 1 queue. To serve more queues, run more processes.

- **Stop:** send `INT` or `TERM`. The server finishes the current job and stops within the server timeout.
- **Errors:** the server logs the exception and sends it to Honeybadger, if Honeybadger is loaded. It does not retry the job.

### Tests

Run the jobs inline, without Redis:

```ruby
Bushpig::Testing.inline! do
  Bushpig.client.submit('company_updates', CompanyUpdate.new('4123456789', 'Acme'))
end
```

## Development

Use Docker:

```sh
docker compose build
docker compose run --rm gem bin/setup
docker compose run --rm gem bin/console
```

Or install Ruby 3.3.11 from `.tool-versions`, then run `bin/setup` and `bin/console`.

Bushpig has no test suite. Check each change against a real Redis server.

## Releasing

> [!WARNING]
> Do not run `bundle exec rake release`. It pushes the gem to rubygems.org, not to `gems.zero-one.io`.

1. Update the version in `lib/bushpig/version.rb`.
2. Update `Gemfile.lock`: `docker compose run --rm gem bundle lock`
3. Build the gem: `docker compose run --rm gem bundle exec rake build`. This writes `pkg/bushpig-<version>.gem`.
4. Upload the `.gem` file to `gems.zero-one.io` by hand.
5. Tag the release: `git tag v<version>` and `git push origin v<version>`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mpowered/bushpig.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
