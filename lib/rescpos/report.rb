module Rescpos
  class Report
    include ERB::Util

    def render(opts = {})
      template = opts[:file] ? File.read(opts[:file]) : opts[:template]
      erb = ERB.new(template, 0, "%<>")
      erb.result(binding)
    end
  end
end
