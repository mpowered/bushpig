require 'thor'
require 'bushpig'

module Bushpig
  class CLI < Thor
    package_name "bushpig"
    desc "serve", "Run the bushpig server"
    def serve
      require 'rails'
      require File.expand_path("./config/environment.rb")
      Bushpig.ping
    end
  end
end
