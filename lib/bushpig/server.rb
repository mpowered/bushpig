# frozen_string_literal: true

module Bushpig
  class Server
    def initialize(queue)
      @queue = queue
      @set = Bushpig::SortedSet.new(@queue)
    end

    def serve
      while true
        j = @set.fetch
        puts j.job_id, j
        handle(j)
      end
    end

    def handle(job)
      klass = const_get("#{job.class.name}Handler")
      klass.new.handle(job)
    end
  end
end
