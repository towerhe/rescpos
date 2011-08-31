require "erb"
require "socket"

require "core_ext/string"

require "rescpos/version"
require "rescpos/printer"
require "rescpos/table"
require "rescpos/report_util"
require "iconv"
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
