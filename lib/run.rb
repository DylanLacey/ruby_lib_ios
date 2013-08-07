# encoding: utf-8
require 'rubygems'
require 'test_runner'
require 'spec'
=begin
node server.js -V --fast-reset --without-delay

Run all Android tests:
  ruby run.rb android

Run only the view album test:
  ruby run.rb ios view_album
=end

# Sanity check
a = OpenStruct.new x: 'ok'
raise 'x issue' unless a.x == 'ok'

## common methods

def screen
  $driver.find_element(:tag_name, 'navigationBar').name
end

def catalog
  'UICatalog'
end
##

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

Appium::Driver.new(debug: true, wait: 1).start_driver

=begin
# Android doesn't like to be reset before booting up
case device
  when 'android'
    button 'start button'
    mobile :reset
end
=end

test_files = []

if one_test
  one_test = File.join(dir, test_dir + 'specs/', one_test)
  # require support (common.rb)
  Dir.glob(File.join dir, test_dir + '/*.rb') do |test|
    require test
    test_files << test
  end
  puts "Loading one test: #{one_test}"
  require one_test
  test_files << one_test
else
  # require all
  Dir.glob(File.join dir, test_dir + '**/*.rb') do |test|
    # load all tests
    puts "  #{File.basename(test, '.*')}"
    require test
    test_files << test
  end
end

# Run Minitest. Provide test file array for tracing.
Minitest.run_specs({ :trace => test_files })

# Exit after tests.
Minitest.after_run { x }