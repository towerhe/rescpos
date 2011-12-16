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

printer = Rescpos::Printer.open("192.168.1.4", 9100)
printer.print_report(DishItemReport.new)
# printer.print_report(BillListReport.new)
# printer.print_report(ArrayTableReport.new)
printer.close
