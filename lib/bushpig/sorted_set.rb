# frozen_string_literal: true

module Bushpig
  class SortedSet
    def initialize(name)
      @name = name
    end

    def redis_pool
      Bushpig.redis_pool
    end

    def set_key
      "set:#{@name}"
    end

    def job_key(job_id)
      "job:#{job_id}"
    end

    def submit(job, score)
      redis_pool.with do |conn|
        conn.set(job_key(job.job_id), job.job_payload)
        conn.zadd(set_key, score, job.job_id)
      end
    end

    def fetch
      redis_pool.with do |conn|
        (jid, _score) = conn.bzpopmin(set_key)
        payload = conn.get(job_key(jid))
        conn.del(job_key(jid))
        Bushpig::Job.hydrate(jid, payload)
      end
    end
  end
end
