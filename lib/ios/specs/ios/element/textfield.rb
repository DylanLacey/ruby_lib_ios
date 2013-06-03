# encoding: utf-8
describe 'ios/element/textfield' do
  before_first do
    screen.must_equal catalog
    s_text('textfield').click
    screen.must_equal 'TextFields'
  end

  after_last do
    back
    screen.must_equal catalog
  end

  t 'textfields' do
    exp = ['<enter text>', '<enter text>', '<enter text>', '<enter password>']
    textfields.must_equal exp
  end

  t 'e_textfields' do
    e_textfields.length.must_equal 4
  end

  def enter_text
    '<enter text>'
  end

  t 'first_textfield' do
    first_textfield.text.must_equal enter_text
  end

  def enter_password
    '<enter password>'
  end

  t 'last_textfield' do
    last_textfield.text.must_equal enter_password
  end

  t 'textfield' do
    textfield(0).text.must_equal enter_text
    textfield(enter_text).text.must_equal enter_text
  end

  t 'textfield_include' do
    textfield_include('word').text.must_equal enter_password
  end

  t 'textfield_exact' do
    textfield_exact(enter_password).text.must_equal enter_password
  end
end