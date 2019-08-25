require 'test_helper'

class EntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @blog = blogs(:one)
    @entry = entries(:one)
  end

  test 'should be index' do
    get blog_entries_url(@blog)
    assert_response :success
  end

  test 'should be index as json' do
    get blog_entries_url(@blog), as: :json
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
    get new_blog_entry_path(@blog)
    assert_response :success
  end

  test 'should create entry' do
    assert_difference('Entry.count') do
      post blog_entries_url(@blog), params: { entry: { body: @entry.body,
                                           title: @entry.title } }
    end

    assert_redirected_to entry_url(Entry.last)
  end

  test 'should create entry as json' do
    assert_difference('Entry.count') do
      post blog_entries_url(@blog), params: { entry: { body: @entry.body,
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

    assert_redirected_to blog_entries_url(@blog)
  end

  test 'should destroy entry as json' do
    assert_difference('Entry.count', -1) do
      delete entry_url(@entry), as: :json
    end

    assert_response :success
  end
end