# frozen_string_literal: true

module Bushpig
  class Server
    def initialize(pool, timeout = 60.0, &handler)
      @pool = pool
      @timeout = timeout.to_f
      @handler = handler
    end

    def redis_pool
      @pool
    end

    def serve(queue)
      loop do
        j = fetch(queue)
        if j.nil?
          puts 'waiting for queue'
        else
          puts j.job_id, j
          # klass = Object.const_get("#{job.class.name}Handler")
          # klass.new.handle(job)
          @handler.call(job)
          complete(j)
        end
      end
    end

    def fetch(queue)
      redis_pool.with do |conn|
        res = conn.bzpopmin(Bushpig.set_key(queue), @timeout)
        return nil if res.nil?

        (_set, jid, _score) = res
        conn.sadd('running', jid)

        payload = conn.get(Bushpig.job_key(jid))
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
