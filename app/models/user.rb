class User < ActiveRecord::Base
  has_many :reviews

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true, uniqueness: true, length: { maximum: 32 }
end
