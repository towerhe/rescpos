# -*- encoding: utf-8 -*-
$:.unshift(File.join(File.dirname(__FILE__), "../lib"))
$:.unshift(File.join(File.dirname(__FILE__)))

require 'rescpos'
require 'reports/dish_item_report'

Rescpos.configure do |config|
  config.template_path = File.expand_path(File.join(File.dirname(__FILE__), 'escposes'))
end

report = DishItemReport.new

printer = Rescpos::Printer.open("192.168.1.3", 9100)
printer.print_report(report, :encoding => 'GBK')
printer.close
