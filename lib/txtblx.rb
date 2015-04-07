require 'txtblx/engine'
require 'txtblx/ability_mixin'
require 'txtblx/configuration'

module Txtblx
  def self.config
    @config ||= Configuration.new
  end

  def self.configure
    yield(config)
  end
end
