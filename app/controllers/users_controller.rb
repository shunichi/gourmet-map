class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.order(reviews_count: :desc)
  end

  def show
    @user = User.includes(reviews: :restaurant).find(params[:id])
  end
end
