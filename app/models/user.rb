class User < ActiveRecord::Base
  has_many :reviews

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true, uniqueness: true, length: { maximum: 16 }
  validate :allowed_email

  enum role: [:user, :admin]
  mount_uploader :image, ImageUploader

  before_create :set_role

  def set_role
    self.role = 'admin' if self.class.admin_emails.member?(email)
  end

  def self.admin_emails
    if ENV['ADMIN_EMAILS']
      ENV['ADMIN_EMAILS'].split(',').map(&:strip).map(&:downcase)
    else
      []
    end
  end

  def image_url
    image.present? ? image.url : '/noimage.png'
  end

  def thumnail_url
    image.present? ? image.thumb.url : '/noimage.png'
  end

  def allowed_email
    email = self.email.downcase
    return if self.class.admin_emails.member?(email)
    if ENV['EMAIL_REGEXPS']
      email_regexps = ENV['EMAIL_REGEXPS'].split(',').map{ |pat| Regexp.new(pat.strip) }
      unless email_regexps.any?{ |r| r.match(email) }
        errors.add(:email, 'そのメールアドレスでのユーザー登録は受け付けていません')
      end
    end
  end
end
