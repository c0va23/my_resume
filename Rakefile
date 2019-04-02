# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

MyResume::Application.load_tasks

begin
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new(:rubocop) do |t|
    t.options = ['--config', '.rubocop.yml']
  end

  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)

  task default: %i(rubocop spec)
# Skip develpment dependencies
rescue LoadError => e
  puts e
end
