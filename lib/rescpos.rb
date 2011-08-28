require "erb"
require "rescpos/version"
require "rescpos/configuration"
require "rescpos/report"

module Rescpos
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield configuration if block_given?
  end
end
