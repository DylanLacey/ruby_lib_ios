# encoding: utf-8

describe 'common/element/button' do
  before_first do
    screen.must_equal catalog
    # nav to buttons activity
    wait { name('buttons').click }
  end

  after_last do
    # nav back to start
    back_click
  end

  def gray
    'Gray'
  end

  t 'button' do
    # by index
    button(2).name.must_equal gray

    # by name contains
    button('ray').name.must_equal gray
  end

  t 'buttons' do
    exp = ['Back', 'Gray', 'Right pointing arrow', 'Rounded', 'More info', 'More info', 'More info', 'Add contact']
    buttons.must_equal exp
  end

  t 'first_button' do
    first_button.name.must_equal 'Back'
  end

  t 'last_button' do
    last_button.name.must_equal 'Add contact'
  end

  t 'button_exact' do
    button_exact(gray).name.must_equal gray
  end

  t 'buttons_exact' do
    buttons_exact(gray).first.name.must_equal gray
  end

  t 'e_buttons' do
    e_buttons.length.must_equal 8
  end

  t 'button_num' do
    # select the second button containing 'in'
    button_num('in', 2).name.must_equal 'More info'
  end
end