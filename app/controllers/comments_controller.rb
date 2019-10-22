class CommentsController < ApplicationController
  before_action :set_comment, only: %i[destroy approve]
  before_action :set_entry_by_params, only: [:create]
  before_action :set_entry_by_association, only: %i[destroy approve]

  def create
    @comment = @entry.comments.build(comment_params)

    if @comment.save
      redirect_to @entry, notice: 'Comment was successfully created.'
    else
      render :show, location: @entry
    end
  end

  def destroy
    @comment.destroy
    redirect_to entry_url(@entry), notice: 'Comment was successfully destroyed.'
  end

  def approve
    @comment.update(status: 'approved')
    redirect_to entry_url(@entry), notice: 'Comment was successfully approved.'
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :status)
  end

  def set_entry_by_params
    @entry = Entry.find(params[:entry_id])
  end

  def set_entry_by_association
    @entry = @comment.entry
  end
end