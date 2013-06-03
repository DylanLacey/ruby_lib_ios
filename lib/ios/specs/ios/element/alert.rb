# encoding: utf-8
describe 'ios/element/alert' do

  before_first do
    screen.must_equal catalog
    # scroll to alerts
    mobile :flick, endX: 0.5, endY: 0.0
    wait_true { s_text('alerts').click; tag('navigationBar').name == 'Alerts' } # wait for true
    tag('navigationBar').name.must_equal 'Alerts' # assert
    # swipe to ok-cancel alert
    mobile :flick, endX: 0.5, endY: 0.0
  end

  after_last do
    back
  end

  before do
    open_alert
  end

  def open_alert
    wait_true { s_text('Show OK-Cancel').click; alert_accept_text == 'OK'  }
  end

  # UIAlertView
  t 'alert_click' do
    alert_click('OK')
  end

  t 'alert_text' do
    alert_text.must_equal 'UIAlertView'
    alert_accept
  end

  t 'alert_accept' do
    alert_accept
  end

  t 'alert_accept_text' do
    alert_accept_text.must_equal 'OK'
    alert_accept
  end

  t 'alert_dismiss' do
    alert_dismiss
  end

  t 'alert_dismiss_text' do
    alert_dismiss_text.must_equal 'Cancel'
    alert_dismiss
  end
end