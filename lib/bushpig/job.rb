# frozen_string_literal: true

require "digest"
require "securerandom"
require "json"

module Bushpig
  module Job
    def self.job(*args)
      Struct.new(*args) do
        def job_id
          @job_id ||= SecureRandom.hex(32)
        end

        def job_id=(job_id)
          @job_id = job_id
        end

        def job_payload
          JSON.generate({class: self.class.name, args: each.to_a})
        end
      end
    end

    def self.keyed(unique, *args)
      Struct.new(*args) do
        @@unique = unique

        def job_id
          @@unique.inject(Digest::SHA256.new) do |digest, key|
            digest.update(self[key].to_s)
          end.hexdigest
        end

        def job_id=(job_id)
        end

        def job_payload
          JSON.generate({class: self.class.name, args: each.to_a})
        end
      end
    end

    def self.hydrate(job_id, job_payload)
      h = JSON.parse(job_payload, symbolize_names: true)
      klass = const_get(h[:class])
      job = klass.new(*h[:args])
      job.job_id = job_id
      job
    end
  end
end