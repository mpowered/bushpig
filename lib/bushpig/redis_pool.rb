# frozen_string_literal: true

require 'connection_pool'
require 'redis'

module Bushpig
  class RedisPool
    def initialize(size: 1, timeout: 5, redis_options: {})
      @size = size
      @timeout = timeout
      @redis_options = redis_options

      @pool = ConnectionPool.new(size: @size, timeout: @timeout) { Redis.new(@redis_options) }
    end

    def with(options = {}, &block)
      raise ArgumentError, 'requires a block' unless block_given?

      retries = 1
      begin
        @pool.with(options, &block)
      rescue Redis::TimeoutError
        if retries > 0
          retries -= 1
          retry
        end
        raise
      end
    end
  end
end
