# encoding: utf-8
describe 'ios/element/generic' do
  before_first { screen.must_equal catalog }
  def exp_text
    'TextFields, Uses of UITextField'
  end

  t 'find' do
    find('text').text.must_equal exp_text
  end

  t 'finds' do
    finds('text').first.text.must_equal exp_text
  end

  t 'text' do
    text('text').text.must_equal exp_text
  end

  t 'texts' do
    texts('text').first.text.must_equal exp_text
  end

  t 'name' do
    name('text').name.must_equal exp_text
  end

  t 'names' do
    names('text').first.name.must_equal exp_text
  end
end