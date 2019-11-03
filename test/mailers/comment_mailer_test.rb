require 'test_helper'

class CommentMailerTest < ActionMailer::TestCase
  test 'ask_approval' do
    email = CommentMailer.with(blog: Blog.first,
                               entry: Entry.first,
                               comment: Comment.first).ask_approval

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal ['noreply@example.com'], email.from
    assert_equal ['admin@example.com'], email.to
    assert_equal '新しいコメントが登録されました。', email.subject
    assert_match Comment.first.body, email.body.encoded
  end
end
