# frozen_string_literal: true

require 'connection_pool'
require 'redis'

module Bushpig
  class RedisPool
    def initialize(size = 1, timeout = 5, redis_options = {})
      @size = size
      @timeout = timeout
      @redis_options = redis_options

      @pool = ConnectionPool.new(size: @size, timeout: @timeout) { Redis.new(@redis_options) }
    end

    def with(options = {}, &block)
      raise ArgumentError, 'requires a block' unless block_given?

      @pool.with(options, &block)
    end
  end
end
