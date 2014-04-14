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

  t 'available_contexts' do
    available_contexts.must_equal ["NATIVE_APP"]
  end

  t 'current_context' do
    current_context.must_equal nil
  end

  t 'switch_to_default_context' do
    switch_to_default_context
    current_context.must_equal nil
  end
end