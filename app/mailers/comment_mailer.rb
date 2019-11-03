class CommentMailer < ApplicationMailer
  def ask_approval
    @blog = params[:blog]
    @entry = params[:entry]
    @comment = params[:comment]
    mail(to: 'admin@example.com', subject: '新しいコメントが登録されました。')
  end
end
