require 'thor'
require 'bushpig'

module Bushpig
  class CLI < Thor
    package_name "bushpig"
    desc "serve", "Run the bushpig server"
    def serve
      Bushpig.hello
    end
  end
end
