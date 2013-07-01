# encoding: utf-8
require 'rubygems'
require 'rake'

def bash cmd
  begin
    sh cmd
  rescue
    Rake::Task['install'].execute
    sh cmd
  end
end

# Run a single test with:
# rake ios['ios/element/generic']
#
# rake ios['driver']
#
# Run all tests with:
# rake ios
desc 'Run the iOS tests'
task :ios, :args, :test_file do |args, test_file|
  # rake android['ok']
  # args = android
  # test_file = {:args=>"ok"}
  test_file = test_file[:args]
  path = File.expand_path('appium.txt', Rake.application.original_dir)
  ENV['APPIUM_TXT'] = path
  puts "Rake appium.txt path is: #{path}"
  cmd = 'bundle exec ruby ./lib/run.rb ios'
  cmd += %Q( "#{test_file}") if test_file
  bash cmd
end

desc 'Run bundle install'
task :install do
  sh 'bundle install'
end