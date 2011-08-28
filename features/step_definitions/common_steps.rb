Given /^a file named "([^"]*)" with:$/ do |file_name, file_content|
  write_file(file_name, file_content)
end
