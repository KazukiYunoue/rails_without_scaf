require 'test_helper'

class EntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entry = entries(:one)
  end

  test 'should be index' do
    get entries_url
    assert_response :success
  end

  test 'should show entry' do
    get entry_url(@entry)
    assert_response :success
  end
end