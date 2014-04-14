describe('accessibility_id') do
  before_first { screen.must_equal catalog }
    
  t 'single_elements' do
    elements = find_element(:accessibility_id, 'Images, Use of UIImageView')
    elements.name.must_equal 'Images, Use of UIImageView'
  end

  t 'groups_of_elements' do
    elements = find_elements(:accessibility_id, 'View')
    elements.length.must_equal 3
  end
end