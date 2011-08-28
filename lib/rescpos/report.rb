module Rescpos
  class Report
    include ERB::Util
    include ReportUtil

    def render(opts = {})
      template = opts[:file] ? File.read(opts[:file]) : opts[:template]
      unless template
        template_filename = self.class.to_s.gsub(/Report/, '').underscore
        template = File.read(File.join(Rescpos.configuration.template_path, "#{template_filename}.escpos.erb"))
      end
      erb = ERB.new(template, 0)
      erb.result(binding)
    end
  end
end
