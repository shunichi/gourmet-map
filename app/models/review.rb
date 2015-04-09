class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant, touch: true

  validates :user_id, presence: true
  validates :restaurant_id, presence: true
  validates :body, presence: true
end
