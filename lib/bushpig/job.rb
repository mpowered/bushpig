# frozen_string_literal: true

require 'digest'
require 'securerandom'
require 'json'

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

        def job_key
          job_id
        end

        def job_payload
          JSON.generate({ class: self.class.name, id: job_id, args: each.to_a })
        end
      end
    end

    def self.keyed(unique_key, *args)
      Struct.new(*args) do
        @@unique_key = unique_key

        def job_id
          @job_id ||= SecureRandom.hex(32)
        end

        def job_id=(job_id)
          @job_id = job_id
        end

        def job_key
          @@unique_key.inject(Digest::SHA256.new) do |digest, key|
            digest.update(self[key].to_s)
          end.hexdigest
        end

        def job_payload
          JSON.generate({ class: self.class.name, id: job_id, args: each.to_a })
        end
      end
    end

    def self.hydrate(job_payload)
      h = JSON.parse(job_payload, symbolize_names: true)
      klass = const_get(h[:class])
      job = klass.new(*h[:args])
      job.job_id = h[:id]
      job
    end
  end
end
