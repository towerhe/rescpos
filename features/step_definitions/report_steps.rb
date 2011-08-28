Given /^a ESC\/POS template:$/ do |string|
  @str_template = string
end

Given /^a titled report:$/ do |string|
  eval string
end

When /^I render the titled report with the given template$/ do
  @output = @report.render(:template => @str_template)
end

Then /^I will see "([^"]*)"$/ do |title|
  @output.should == title
end
