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

  def self.options
    @options ||= DEFAULTS.dup
  end

  def self.options=(opts)
    @options = opts
  end

  def self.redis_pool
    puts options
    @redis_pool ||= Bushpig::RedisPool.new(options.fetch(:pool), options.fetch(:redis))
  end

  def self.ping
    redis_pool.with do |conn|
      conn.ping
      puts "HERE"
    end
  end

  def self.configure_server
    yield @options if server?
  end

  def self.configure_client
    yield @options unless server?
  end

  def self.server?
    defined?(Bushpig::CLI)
  end
end
