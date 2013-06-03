# encoding: utf-8
describe 'ios/element/generic' do
  before_first { screen.must_equal catalog }
  def exp_text
    'TextFields, Uses of UITextField'
  end

  def search_text
    'TextFields'
  end

  t 'find' do
    find(search_text).text.must_equal exp_text
  end

  t 'finds' do
    finds(search_text).first.text.must_equal exp_text
  end

  t 'text' do
    text(search_text).text.must_equal exp_text
  end

  t 'texts' do
    texts(search_text).first.text.must_equal exp_text
  end

  t 'name' do
    name(search_text).name.must_equal exp_text
  end

  t 'names' do
    names(search_text).first.name.must_equal exp_text
  end
end