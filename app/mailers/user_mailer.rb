class UserMailer < ActionMailer::Base
  default from: ENV['MAIL_SENDER']
  add_template_helper ApplicationHelper

  def restaurant_created(restaurant)
    @restaurant = restaurant
    mail(bcc: User.pluck(:email), subject: "[#{ENV['PAGE_TITLE']}] 新しいお店の情報が登録されました！" )
  end
end