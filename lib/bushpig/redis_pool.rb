# frozen_string_literal: true

require "connection_pool"
require "redis"

module Bushpig
  class RedisPool
    def initialize(options)
      @size = options[:size]
      @timeout = options[:timeout]
      @redis = options[:redis]

      @pool = ConnectionPool.new(size: @size, timeout: @timeout) { Redis.new(@redis) }
    end

    def with(options = {})
      raise ArgumentError, "requires a block" unless block_given?
      @pool.with(options) do |conn|
        yield conn
      end
    end
  end
end