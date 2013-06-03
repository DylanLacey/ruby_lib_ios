# encoding: utf-8

=begin
  Skip:
    status # status patches are already tested in driver.rb
    raw_execute # debug output for Pry
=end

describe 'common/patch.rb' do
# Attributes are busted in Android.
# Blocked on https://github.com/appium/appium/issues/628
  describe 'Selenium::WebDriver::Element methods' do
    # Android supports exactly two string Attributes
    # .name and .text
    # https://github.com/appium/appium/blob/ea3450e7f78d1794bab42fa396a387e7b86fd3b3/android/bootstrap/src/io/appium/android/bootstrap/handler/GetAttribute.java#L43
    # t 'value' do; end # Doesn't work on Android

    t 'name' do
      first_s_text.name.must_equal 'API Demos'
    end

    # t 'tag_name' do; end # Doesn't work on Android

    # location_rel # iOS Only. Android is blocked on https://github.com/appium/appium/issues/627
  end

  describe 'common patch' do
    # By default, the webdriver gem will return message instead of origValue
    # {"message":"An unknown server-side error occurred while processing the command.","origValue":"Strategy id is not valid."}
    t 'error_message' do
      value = ''
      begin
        set_wait 0
        find_element(:id, 'ok')
      rescue Exception => e;
        value = e.message
      end
      value.must_equal 'Strategy id is not valid.'
    end
  end
end