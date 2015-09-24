class UserMailerPreview < ActionMailer::Preview
  # Preview this email at http://gourmet-map.dev/rails/mailers/user_mailer/comment_created
  def comment_created
    UserMailer.comment_created(Comment.last)
  end

  # Preview this email at http://gourmet-map.dev/rails/mailers/user_mailer/announce
  def announce
    subject = '新機能追加のお知らせ'
    content = <<EOS
新機能 ○○ が追加されました。
ぜひ使ってみてください。
EOS
    UserMailer.announce(subject, content)
  end
end