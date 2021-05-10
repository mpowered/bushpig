# frozen_string_literal: true

require "connection_pool"
require "redis"

module Bushpig
  class RedisPool
    DEFAULTS = { size: 5, timeout: 5, redis_opts: {} }

    def initialize(options = {})
      options = DEFAULTS.merge(options)

      @size = options.fetch(:size)
      @timeout = options.fetch(:timeout)
      @redis_opts = options.fetch(:redis_opts)

      @redis = ConnectionPool.new(size: @size, timeout: @timeout) { Redis.new(@redis_opts) }
    end

    def with(options = {})
      raise ArgumentError, "requires a block" unless block_given?
      @redis.with(options) do |conn|
        yield conn
      end
    end
  end
end