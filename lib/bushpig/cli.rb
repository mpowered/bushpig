require 'thor'
require 'bushpig'

# SmsScorecardUpdate = Bushpig::Job.keyed([:spend_period_id], :spend_period_id, :sms_subdomain)
# SmsScorecardUpdate = Bushpig::Job.job(:spend_period_id, :sms_subdomain)

module Bushpig
  class CLI < Thor
    package_name "bushpig"
    desc "serve", "Run the bushpig server"
    def serve
      require 'rails'
      require File.expand_path("./config/environment.rb")
      # s = SmsScorecardUpdate.new(1, 'www')
      # puts s.job_id

      # u = Bushpig::SortedSet.new('scorecard_update')
      # u.submit(s, 100.0)

      # j = u.fetch
      # puts j
      # puts j.job_id
    end
  end
end