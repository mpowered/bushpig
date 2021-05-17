# frozen_string_literal: true

require 'bushpig/version'

require 'bushpig/redis_pool'
require 'bushpig/job'
require 'bushpig/client'
require 'bushpig/server'

module Bushpig
  NAME = 'Bushpig'
  LICENSE = 'See LICENSE and the MIT License for licensing details.'

  def self.client
    raise 'Bushpig client not configured' unless @client

    @client
  end

  def self.client=(client)
    @client = client
  end

  def self.server
    raise 'Bushpig server not configured' unless @server

    @server
  end

  def self.server=(server)
    @server = server
  end

  def self.configure_server
    yield self if server?
  end

  def self.configure_client
    yield self unless server?
  end

  def self.server?
    defined?(Bushpig::CLI)
  end

  def self.set_key(queue)
    "set:#{queue}"
  end

  def self.job_key(job_id)
    "job:#{job_id}"
  end
end
