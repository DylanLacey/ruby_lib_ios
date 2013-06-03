# encoding: utf-8
describe 'common/helper.rb' do
  # wait is a success unless an error is raised
  # max_wait=0 is infinity to use 0.1
  t 'wait' do
    # successful wait should not error
    message = nil
    begin
      wait(0.1,0) { true }
    rescue Exception => e
      message = e.message
    end
    message.must_equal nil

    # failed wait should error
    begin
      wait(0.1,0) { raise 'error' }
    rescue Exception => e
      message = e.message
    end
    message.must_equal 'execution expired'
  end

  # wait_true is a success unless the value is not true
  t 'wait_true' do
    # successful wait should not error
    message = nil
    begin
      wait_true(0.1,0) { true }
    rescue Exception => e
      message = e.message
    end
    message.must_equal nil

    # failed wait should error
    begin
      wait_true(0.1,0) { false }
    rescue Exception => e
      message = e.message
    end
    message.must_equal 'execution expired'
  end

  # t 'id' # id is for Selendroid

  t 'back' do
    # start page
    tag('navigationBar').name.must_equal 'UICatalog'
    # nav to new page.
    wait_true { s_text('buttons').click; tag('navigationBar').name == 'Buttons' }
    tag('navigationBar').name.must_equal 'Buttons'
    # go back
    back
    # start page
    tag('navigationBar').name.must_equal 'UICatalog'
  end

  t 'session_id' do
    session_id.must_match /\h{8}-\h{4}-\h{4}-\h{4}-\h{12}/
  end

  t 'xpath' do
    xpath('//text').name.must_equal 'UICatalog'
  end

  t 'xpaths' do
    xpaths('//text').length.must_equal 13
  end

  def uibutton_text
    'Buttons, Various uses of UIButton'
  end

  t 'ele_index' do
    ele_index('text', 1).name.must_equal uibutton_text
  end

  t 'find_eles' do
    find_eles('text').length.must_equal 13
  end

  t 'find_ele_by_text' do
    el_id = find_ele_by_text(:text, uibutton_text).instance_variable_get :@id
    el_id.must_match /\d+/
  end

  t 'find_eles_by_text' do
    # '!' clears the input buffer in Pry so make sure there's
    # no space after the !
    # empty array returned when no match
    found = !find_eles_by_text(:text, uibutton_text).empty?
    found.must_equal true

    found = !find_eles_by_text(:text, 'zz').empty?
    found.must_equal false
  end

  t 'find_ele_by_attr_include' do
    el_text = find_ele_by_attr_include(:text, :text,  'button').text
    el_text.must_equal uibutton_text
  end

  t 'find_eles_by_attr_include' do
    ele_count = find_eles_by_attr_include(:text, :text,  'e').length
    ele_count.must_equal 12
  end

  t 'find_ele_by_text_include' do
    el_text = find_ele_by_text_include(:text, 'bu').text
    el_text.must_equal uibutton_text
  end

  t 'find_eles_by_text_include' do
    ele_count = find_eles_by_text_include(:text, 'e').length
    ele_count.must_equal 12
  end

  t 'first_ele' do
    first_ele(:text).text.must_equal 'UICatalog'
  end

  t 'last_ele' do
    last_ele(:text).text.must_equal 'Transitions, Shows UIViewAnimationTransitions'
  end

  # t 'source' do # tested by get_source

  t 'get_source' do
    get_source.class.must_equal Hash
  end

  t 'find_name' do
    find_name(uibutton_text).name.must_equal uibutton_text
  end

  t 'find_names' do
    find_names(uibutton_text).first.name.must_equal uibutton_text
  end
end