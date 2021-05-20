# frozen_string_literal: true

module Bushpig
  class Server
    def initialize(pool, timeout: 2, &handler)
      @pool = pool
      @timeout = timeout.to_i
      @handler = handler
      @done = false
    end

    def redis_pool
      @pool
    end

    def trap_signals
      Signal.trap('INT') do
        reset_signals
        puts 'INT received, shutdown flagged'
        @done = true
      end
      Signal.trap('TERM') do
        reset_signals
        puts 'TERM received, shutdown flagged'
        @done = true
      end
    end

    def reset_signals
      Signal.trap('INT', 'DEFAULT')
      Signal.trap('TERM', 'DEFAULT')
    end

    def serve(queue)
      puts "Serving queue #{queue}"
      trap_signals

      until @done
        job = fetch(queue)
        next if job.nil?

        handle(job)
        complete(job)
      end

      reset_signals
      puts "Stop serving queue #{queue}"
    end

    def handle(job)
      puts "Job starting: jid-#{job.job_id} jkey-#{job.job_key} #{job}"
      started = monotonic_time
      @handler.call(job)
      finished = monotonic_time
      elapsed = finished - started
      puts "Job completed: jid-#{job.job_id} #{elapsed} seconds"
    rescue StandardError => e
      finished = monotonic_time
      elapsed = finished - started
      puts "Job raised exception: jid-#{job.job_id} #{elapsed} seconds: #{e}"
      notify_exception(job, e)
    end

    def honeybadger
      @honeybadger ||= begin
        Honeybadger
      rescue NameError
        nil
      end
    end

    def notify_exception(job, exception)
      honeybadger&.notify(exception, context: { job_id: job.job_id, job_key: job.job_key, job: job.to_s })
    end

    def monotonic_time
      Process.clock_gettime(Process::CLOCK_MONOTONIC)
    end

    def fetch(queue)
      redis_pool.with do |conn|
        begin
          res = conn.bzpopmin(Bushpig.queue_key(queue), @timeout)
        rescue Redis::TimeoutError
          # TODO: warn user (once) that redis timeout set lower than pop timeout
          conn.close
          res = nil
        end
        return nil if res.nil?

        (_set, key, _score) = res
        # conn.sadd('running', key)

        payload = conn.get(Bushpig.job_key(key))
        return nil if payload.nil? # most likely job expired

        Bushpig::Job.hydrate(payload)
      end
    end

    def complete(job)
      redis_pool.with do |conn|
        # conn.srem('running', job.job_key)
        conn.del(Bushpig.job_key(job.job_key))
      end
    end
  end
end
