require 'test_helper'

class EntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entry = entries(:one)
  end

  test 'should be index' do
    get entries_url
    assert_response :success
  end

  test 'should be index as json' do
    get entries_url, as: :json
    assert_response :success
  end

  test 'should show entry' do
    get entry_url(@entry)
    assert_response :success
  end

  test 'should show entry as json' do
    get entry_url(@entry), as: :json
    assert_response :success
  end

  test 'should get new' do
    get new_entry_url
    assert_response :success
  end

  test 'should create entry' do
    assert_difference('Entry.count') do
      post entries_url, params: { entry: { body: @entry.body,
                                           title: @entry.title } }
    end

    assert_redirected_to entry_url(Entry.last)
  end

  test 'should create entry as json' do
    assert_difference('Entry.count') do
      post entries_url, params: { entry: { body: @entry.body,
                                           title: @entry.title } }, as: :json
    end

    assert_response :success
  end

  test 'should get edit' do
    get edit_entry_url(@entry)
    assert_response :success
  end

  test 'should update entry' do
    patch entry_url(@entry), params: {entry: { title: @entry.title,
                                               body: @entry.body } }
    assert_redirected_to entry_url(@entry)
  end

  test 'should update entry as json' do
    patch entry_url(@entry), params: {entry: { title: @entry.title,
                                               body: @entry.body } }, as: :json
    assert_response :success
  end

  test 'should destroy entry' do
    assert_difference('Entry.count', -1) do
      delete entry_url(@entry)
    end

    assert_redirected_to entries_url
  end

  test 'should destroy entry as json' do
    assert_difference('Entry.count', -1) do
      delete entry_url(@entry), as: :json
    end

    assert_response :success
  end
end