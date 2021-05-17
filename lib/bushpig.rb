# frozen_string_literal: true

require 'bushpig/version'

require 'bushpig/redis_pool'
require 'bushpig/job'
require 'bushpig/client'
require 'bushpig/server'

module Bushpig
  NAME = 'Bushpig'
  LICENSE = 'See LICENSE and the MIT License for licensing details.'

  def self.set_key(queue)
    "set:#{queue}"
  end

  def self.job_key(job_id)
    "job:#{job_id}"
  end
end
