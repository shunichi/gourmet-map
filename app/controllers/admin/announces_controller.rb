class Admin::AnnouncesController < Admin::ApplicationController
  def new
    @announce = Announce.new
  end

  def create
    @announce = Announce.new(announce_params)
    respond_to do |format|
      if @announce.valid?
        UserMailer.announce(@announce).deliver
        format.html { redirect_to new_admin_announce_url, notice: 'アナウンスメールを送信しました' }
      else
        format.html { render :new }
      end
    end
  end

  private
  def announce_params
    params.require(:announce).permit(:subject, :body)
  end
end
