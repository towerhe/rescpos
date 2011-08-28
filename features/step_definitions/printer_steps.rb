Given /^I have a printer with ip "([^"]*)" and port "([^"]*)"$/ do |ip, port|
  @printer = Rescpos::Printer.new(ip, port)
end

When /^I connect the printer$/ do
  @client = @printer.connect()
end
