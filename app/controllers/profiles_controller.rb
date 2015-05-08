class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def edit
  end

  def update
    respond_to do |format|
      if current_user.update(user_params)
        format.html { redirect_to root_url, notice: 'アカウント情報が更新されました' }
      else
        format.html { render :edit }
      end
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :image)
  end
end