# frozen_string_literal: true

module Bushpig
  class Server
    def initialize(pool, timeout: 60.0, &handler)
      @pool = pool
      @timeout = timeout.to_f
      @handler = handler
    end

    def redis_pool
      @pool
    end

    def serve(queue)
      puts "Serving queue #{queue}"
      loop do
        job = fetch(queue)
        next if job.nil?

        puts "Job starting: #{job.job_id} #{job}"
        handle(job)
        puts "Job completed: #{job.job_id}"
        complete(job)
      end
    end

    def handle(job)
      @handler.call(job)
    rescue StandardError => e
      # Job handler raised exception
      # TODO: log exception
      puts "Exception raised in job handler: #{e}"
    end

    def fetch(queue)
      redis_pool.with do |conn|
        begin
          res = conn.bzpopmin(Bushpig.set_key(queue), @timeout)
        rescue Redis::TimeoutError
          # TODO: warn user (once) that redis timeout set lower than pop timeout
          conn.close
          res = nil
        end
        return nil if res.nil?

        (_set, jid, _score) = res
        # conn.sadd('running', jid)

        payload = conn.get(Bushpig.job_key(jid))
        return nil if payload.nil? # most likely job expired

        Bushpig::Job.hydrate(jid, payload)
      end
    end

    def complete(job)
      redis_pool.with do |conn|
        # conn.srem('running', job.job_id)
        conn.del(Bushpig.job_key(job.job_id))
      end
    end
  end
end
