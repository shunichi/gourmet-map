class Announce
  include ActiveModel::Model
  attr_accessor :subject, :body

  validates :subject, presence: true
  validates :body, presence: true
end
