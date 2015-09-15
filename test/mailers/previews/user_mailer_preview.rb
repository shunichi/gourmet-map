class UserMailerPreview < ActionMailer::Preview
  # Preview this email at http://gourmet-map/rails/mailers/user_mailer/comment_created
  def comment_created
    UserMailer.comment_created(Comment.last)
  end
end