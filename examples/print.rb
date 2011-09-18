# -*- encoding: utf-8 -*-
$:.unshift(File.join(File.dirname(__FILE__), "../lib"))
$:.unshift(File.join(File.dirname(__FILE__)))

require 'rescpos'
require 'reports/dish_item_report'
require 'reports/bill_list_report'
require 'reports/array_table_report'

Rescpos.configure do |config|
  config.template_path = File.expand_path(File.join(File.dirname(__FILE__), 'escposes'))
end

report = DishItemReport.new
report1 = BillListReport.new

printer = Rescpos::Printer.open("192.168.1.3", 9100)
# printer.print_report(report, :encoding => 'GBK')
# print table 
# printer.print_report(report1, :encoding => 'GBK')
printer.print_report(ArrayTableReport.new)
printer.close
