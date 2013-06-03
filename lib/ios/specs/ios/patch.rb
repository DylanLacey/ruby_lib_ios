# encoding: utf-8

describe 'ios/patch.rb' do
  before_first { screen.must_equal catalog }

  t 'type' do
    # nav to textfield
    s_text('textfields').click

    ele = first_textfield
    ele.type 'ok'
    ele.text.must_equal 'ok'

    # nav to start activity
    button('back').click
  end
end