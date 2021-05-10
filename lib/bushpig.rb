# frozen_string_literal: true

require "bushpig/version"
require "bushpig/client"

require "connection_pool"
require "redis"

module Bushpig
  NAME = "Sidekiq"
  LICENSE = "See LICENSE and the MIT License for licensing details."

  def self.redis
    raise ArgumentError, "requires a block" unless block_given?
    redis_pool.with do |conn|
      yield conn
    end
  end

  def self.redis=(hash)
    puts "redis:", hash
    @redis = if hash.is_a?(ConnectionPool)
      hash
    else
      ConnectionPool.new(hash)
    end
  end

  def self.redis_pool
    @redis ||= ConnectionPool.new(size: 5, timeout: 5) { Redis.new }
  end

  def self.ping
    redis do |conn|
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
    defined?(Sidekiq::CLI)
  end

  def self.rails_app?
    defined?(::Rails) && ::Rails.respond_to?(:application)
  end
end
