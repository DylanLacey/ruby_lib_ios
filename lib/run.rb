# encoding: utf-8
require File.expand_path '../helper.rb', __FILE__

=begin
node server.js -V --fast-reset --without-delay

Run all Android tests:
  ruby run.rb android

Run only the view album test:
  ruby run.rb ios view_album
=end

load_appium_txt file: File.expand_path('..',__FILE__), verbose: true

dir = File.expand_path '..', __FILE__
device = ARGV[0].downcase.strip
devices = %w[ android selendroid ios ]
raise 'Expected android, selendroid or ios as first argument' unless devices.include? device

one_test = ARGV[1]
test_dir = "/#{device}/"

puts 'Start driver'
use_selendroid = device == 'selendroid'
puts "Use selendroid? #{use_selendroid}"

Appium::Driver.new(debug: true, selendroid: use_selendroid, wait: 1).start_driver

=begin
# Android doesn't like to be reset before booting up
case device
  when 'android'
    button 'start button'
    mobile :reset
end
=end

if one_test
  one_test = File.join(dir, test_dir + 'specs/', one_test)
  # require support (common.rb)
  Dir.glob(File.join dir, test_dir + '/*.rb') do |test|
    require test
  end
  puts "Loading one test: #{one_test}"
  require one_test
else
  # require all
  Dir.glob(File.join dir, test_dir + '**/*.rb') do |test|
    # load all tests
    puts "  #{File.basename(test, '.*')}"
    require test
  end
end

# Exit after tests.
MiniTest::Unit.after_tests { x }

=begin
# Update sauce after all tests complete
MiniTest::Unit.after_tests do
  # $passed is set in after_suites
  update_sauce passed: $passed
end
=end