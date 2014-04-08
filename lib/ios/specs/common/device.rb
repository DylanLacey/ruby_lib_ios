describe 'common/device' do
  before_first { screen.must_equal catalog }

  t 'lock' do
    lock 5
    tag('button').name.must_equal 'SlideToUnlock'

    # It appears that lockForDuration doesn't.
    closeApp
    launch
  end

  t 'shake' do
    shake
  end

  # Not supported on simulator
  t 'remove' do
  end

  # Not supported on simulator
  t 'install' do
  end

  t 'close and launch' do
    closeApp
    launch
    tag('navigationBar').name.must_equal 'UICatalog'
  end
end