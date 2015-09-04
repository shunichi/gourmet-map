class Review < ActiveRecord::Base
  acts_as_commentable
  belongs_to :user, counter_cache: true
  belongs_to :restaurant, touch: true, counter_cache: true

  validates :user_id, presence: true
  validates :restaurant_id, presence: true
  validates :body, presence: true
end
