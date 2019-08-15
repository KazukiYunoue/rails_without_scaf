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

  test 'should get new' do
    get new_entry_url
    assert_response :success
  end

  test 'should create entry' do
    assert_difference('Entry.count') do
      post entries_url, params: { entry: { body: @entry.body, title: @entry.title } }
    end

    assert_redirected_to entry_url(Entry.last)
  end

  test 'should get edit' do
    get edit_entry_url(@entry)
    assert_response :success
  end
end