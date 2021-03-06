class ReviewsController < ApplicationController
  before_action :set_restaurant
  before_action :set_review, only: %i(update destroy)

  def create
    @review = @restaurant.reviews.build(review_params)
    @review.user = current_user
    respond_to do |format|
      if @review.save
        UserMailer.review_created(@review).deliver
        flash[:notice] = 'レビューを登録しました'
        format.js { render }
      else
        format.js { render 'failed' } # 何これ？
      end
    end
  end

  def update
    respond_to do |format|
      if @review.update(review_params)
        flash[:notice] = 'レビューを更新しました'
        format.js { render }
      else
        format.js { render 'failed' }
      end
    end
  end

  def destroy
    if @review.user == current_user
      @review.destroy
      flash[:notice] = 'レビューを削除しました'
    end
  end

  private
  def set_restaurant
    @restaurant = Restaurant.includes(reviews: :comments).find(params[:restaurant_id])
  end

  def set_review
    @review = @restaurant.reviews.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:body)
  end
end
