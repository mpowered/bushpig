# frozen_string_literal: true

require "bushpig/version"
require "bushpig/client"
require "bushpig/redis_pool"

module Bushpig
  NAME = "Bushpig"
  LICENSE = "See LICENSE and the MIT License for licensing details."

  DEFAULTS = {
    pool: { size: 5, timeout: 5 },
    redis: { }
  }

  # Requires Ruby 2.5: Options = Struct.new(:pool, :redis, keyword_init: true)
  Options = Struct.new(:pool, :redis)

  def self.options
    # Ruby 2.5: @options ||= Options.new(DEFAULTS.dup)
    opts = DEFAULTS.dup
    @options ||= Options.new(opts[:pool], opts[:redis])
  end

  def self.options=(opts)
    @options = opts
  end

  def self.redis_pool
    puts options
    @redis_pool ||= Bushpig::RedisPool.new(options.pool, options.redis)
  end

  def self.ping
    redis_pool.with do |conn|
      conn.ping
      puts "HERE"
    end
  end

  def self.configure_server
    yield options if server?
  end

  def self.configure_client
    yield options unless server?
  end

  def self.server?
    defined?(Bushpig::CLI)
  end
end
