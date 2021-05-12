# frozen_string_literal: true

require 'bushpig/version'

require 'bushpig/redis_pool'
require 'bushpig/job'
require 'bushpig/sorted_set'
require 'bushpig/server'

module Bushpig
  NAME = 'Bushpig'
  LICENSE = 'See LICENSE and the MIT License for licensing details.'

  DEFAULT = {
    size: 5,
    timeout: 5,
    redis: {}
  }.freeze

  def self.options
    @options ||= DEFAULT.dup
  end

  def self.options=(opts)
    @options = opts
  end

  def self.redis_pool
    @redis_pool ||= Bushpig::RedisPool.new(options)
  end

  def self.configure_server
    yield options if server?
  end

  def self.configure_client
    yield options unless server?
  end

  def self.server?
    defined?(Bushpig::CLI)
  end
end
