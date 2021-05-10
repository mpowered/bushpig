# frozen_string_literal: true

require "bushpig/version"
require "bushpig/client"
require "bushpig/redis_pool"

module Bushpig
  NAME = "Sidekiq"
  LICENSE = "See LICENSE and the MIT License for licensing details."

  def self.redis=(options)
    @redis_pool = Bushpig::RedisPool.new(options)
  end

  def self.redis_pool
    @redis_pool ||= Bushpig::RedisPool.new
  end

  def self.ping
    redis_pool.with do |conn|
      conn.ping
      puts "HERE"
    end
  end

  def self.configure_server
    yield self if server?
  end

  def self.configure_client
    yield self unless server?
  end

  def self.server?
    defined?(Bushpig::CLI)
  end
end
