require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entry = entries(:one)
    @comment = comments(:one)
  end

  test 'should create comment' do
    assert_difference('Comment.count') do
      post entry_comments_url(@entry), params: { comment: { body: @comment.body,
                                                            status: @comment.status } }
    end

    assert_redirected_to entry_url(@entry)
  end

  test 'should deliver email to ask approval' do
    assert_emails 1 do
      post entry_comments_url(@entry), params: { comment: { body: @comment.body,
                                                            status: @comment.status } }
    end
  end

  test 'should destroy comment' do
    assert_difference('Comment.count', -1) do
      delete comment_url(@comment)
    end

    assert_redirected_to entry_url(@entry)
  end

  test 'should approve comment' do
    patch approve_comment_url(@comment)

    assert_redirected_to entry_url(@entry)
  end
end