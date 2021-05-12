# frozen_string_literal: true

require 'thor'
require 'bushpig'

module Bushpig
  class CLI < Thor
    package_name 'bushpig'

    def self.exit_on_failure?
      true
    end

    desc 'serve SET', 'Run the bushpig server'
    def serve(name)
      require 'rails'
      require File.expand_path('./config/environment.rb')

      u = Bushpig::SortedSet.new(name)

      while true
        j = u.fetch
        puts j
        puts j.job_id
      end
    end
  end
end
