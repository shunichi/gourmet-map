class User < ActiveRecord::Base
  has_many :reviews

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true, uniqueness: true, length: { maximum: 16 }
  validate :allowed_email

  def allowed_email
    email = self.email.downcase
    if ENV['ADMIN_EMAILS']
      admin_emails = ENV['ADMIN_EMAILS'].split(',').map(&:strip).map(&:downcase)
      return if admin_emails.member?(email)
    end
    if ENV['EMAIL_REGEXPS']
      email_regexps = ENV['EMAIL_REGEXPS'].split(',').map{ |pat| Regexp.new(pat.strip) }
      unless email_regexps.any?{ |r| r.match(email) }
        errors.add(:email, 'そのメールアドレスでのユーザー登録は受け付けていません')
      end
    end
  end

end
