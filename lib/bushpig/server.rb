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
        puts j
        puts j.job_id
      end
    end
  end
end
