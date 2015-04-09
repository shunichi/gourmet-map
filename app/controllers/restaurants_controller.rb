class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: %i(index show)

  def index
    @restaurants = Restaurant.order(updated_at: :desc)
    @restaurants = @restaurants.tagged_with(params[:tag]) if params[:tag]
    @filter_tag = params[:tag]
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def edit
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to @restaurant, notice: '店の情報を登録しました' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to @restaurant, notice: '店の情報を更新しました' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_url, notice: '店の情報を削除しました' }
    end
  end

  private
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    def restaurant_params
      params.require(:restaurant).permit(:name, :latitude, :longitude, :tag_list, :description, :image)
    end
end
