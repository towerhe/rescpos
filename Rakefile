require "bundler/gem_tasks"

require 'cucumber/rake/task'
Cucumber::Rake::Task.new do |t|
  t.cucumber_opts = %w{--format pretty}
end

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)
