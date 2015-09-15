class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_review, only: %i(create)

  def create
    @comment = @review.comments.build(comment_params)
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        UserMailer.comment_created(@comment).deliver
        format.js
      else
        format.js { render js: 'alert("コメント作成失敗しました");' }
      end
    end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end

  def set_review
    @review = Review.find(params[:review_id])
  end
end