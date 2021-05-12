# frozen_string_literal: true

require 'thor'

module Bushpig
  class CLI < Thor
    package_name 'bushpig'

    def self.exit_on_failure?
      true
    end

    desc 'serve SET', 'Run the bushpig server'
    def serve(queue)
      require 'rails'
      require File.expand_path('./config/environment.rb')

      server = Bushpig::Server.new(queue)
      server.serve
    end
  end
end
