# frozen_string_literal: true

module Bushpig
  class Server
    def initialize(pool, queue, timeout = 60.0, &handler)
      @pool = pool
      @queue = queue
      @timeout = timeout
      @handler = handler
    end

    def redis_pool
      @pool
    end

    def serve
      loop do
        j = fetch
        if j.nil?
          puts 'waiting for queue'
        else
          puts j.job_id, j
          handle(j)
          complete(j)
        end
      end
    end

    def handle(job)
      @handler.call(job)
      # klass = Object.const_get("#{job.class.name}Handler")
      # klass.new.handle(job)
    end

    def fetch
      redis_pool.with do |conn|
        res = conn.bzpopmin(Bushpig.set_key(@queue), @timeout)
        return nil if res.nil?

        (_set, jid, _score) = res
        conn.sadd('running', jid)

        payload = conn.get(Bushpug.job_key(jid))
        Bushpig::Job.hydrate(jid, payload)
      end
    end

    def complete(job)
      redis_pool.with do |conn|
        conn.srem('running', job.job_id)
        conn.del(Bushpig.job_key(job.job_id))
      end
    end
  end
end
