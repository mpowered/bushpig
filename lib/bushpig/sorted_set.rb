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

    def fetch(timeout = 60.0)
      redis_pool.with do |conn|
        res = conn.bzpopmin(set_key, timeout)
        return nil if res.nil?

        (_set, jid, _score) = res
        conn.sadd('running', jid)

        payload = conn.get(job_key(jid))
        Bushpig::Job.hydrate(jid, payload)
      end
    end

    def complete(job)
      redis_pool.with do |conn|
        conn.srem('running', job.job_id)
        conn.del(job_key(job.job_id))
      end
    end
  end
end
