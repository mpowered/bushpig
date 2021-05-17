# frozen_string_literal: true

module Bushpig
  class Client
    def initialize(pool)
      @pool = pool
    end

    def redis_pool
      @pool
    end

    def default_score
      Time.now.to_f
    end

    def submit(queue, job, score: default_score)
      redis_pool.with do |conn|
        conn.set(Bushpig.job_key(job.job_id), job.job_payload)
        conn.zadd(Bushpig.set_key(queue), score, job.job_id)
      end
    end
  end
end
