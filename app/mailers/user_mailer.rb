class UserMailer < ActionMailer::Base
  default from: ENV['MAIL_SENDER']
  add_template_helper ApplicationHelper

  def restaurant_created(restaurant)
    @restaurant = restaurant
    mail(bcc: User.pluck(:email), subject: "[#{ENV['PAGE_TITLE']}] 新しいお店の情報が登録されました！" )
  end

  def review_created(review)
    @review = review
    mail(bcc: User.pluck(:email), subject: "[#{ENV['PAGE_TITLE']}] 「#{@review.restaurant.name}」のレビューが投稿されました！")
  end

  def comment_created(comment)
    @review = comment.commentable
    @comment = comment
    mail(bcc: User.pluck(:email), subject: "[#{ENV['PAGE_TITLE']}] #{@review.user.name}さんの「#{@review.restaurant.name}」のレビューにコメントが投稿されました！")
  end

  def announce(subject, content)
    @content = content
    mail(bcc: User.pluck(:email), subject: "[#{ENV['PAGE_TITLE']}] #{subject}")
  end
end
