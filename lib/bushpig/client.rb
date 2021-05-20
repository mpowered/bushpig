# frozen_string_literal: true

module Bushpig
  class Client
    attr_accessor :default_ttl

    def initialize(pool, &callback)
      @pool = pool
      @default_ttl = nil
      @callback = callback
    end

    def redis_pool
      @pool
    end

    def default_score
      Time.now.to_f
    end

    def submit(queue, job, score: default_score, ttl: default_ttl)
      modified = @callback.call(job)
      redis_pool.with do |conn|
        conn.set(Bushpig.job_key(modified.job_key), modified.job_payload, ex: ttl)
        conn.zadd(Bushpig.queue_key(queue), score, modified.job_key)
      end
    end
  end
end
