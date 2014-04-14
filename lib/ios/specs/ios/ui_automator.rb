describe 'ui_automator' do
  before_first { screen.must_equal catalog }
  
  t 'single_elements' do
    element = find_element(:uiautomation, '.elements()[0]')
    element.name.must_equal catalog
  end

  t 'groups_of_elements' do
    elements = find_elements(:uiautomation, 'elements()')
    elements.length.must_equal 3
  end
end