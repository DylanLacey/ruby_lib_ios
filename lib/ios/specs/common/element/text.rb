# encoding: utf-8
=begin
describe 'common/element/text' do
  t 's_texts' do
    act = s_texts
    exp = ['API Demos', 'Accessibility', 'Animation', 'App', 'Content', 'Graphics', 'Media', 'NFC', 'OS', 'Preference', 'Text', 'Views']
    act.must_equal exp
  end

  t 'e_s_texts' do
    e_s_texts.length.must_equal 12
  end

  t 'first_s_text' do
    first_s_text.text.must_equal 'API Demos'
  end

  t 'last_s_text' do
    last_s_text.text.must_equal 'Views'
  end

  t 's_text' do
    s_text('mos').text.must_equal 'API Demos'
  end

  t 's_text_exact' do
    # should fail
    act = begin; s_text_exact 'mos'; rescue; end
    act.must_be_nil

    # should pass
    s_text_exact('API Demos').text.must_equal 'API Demos'
  end
end
=end