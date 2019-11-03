# Preview all emails at http://localhost:3000/rails/mailers/comment_mailer
class CommentMailerPreview < ActionMailer::Preview
  def ask_approval
    CommentMailer.with(blog: Blog.first,
                       entry: Entry.first,
                       comment: Comment.first).ask_approval
  end
end