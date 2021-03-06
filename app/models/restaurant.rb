class Restaurant < ActiveRecord::Base
  has_many :reviews

  acts_as_taggable

  default_value_for :latitude, 35.66441072050976
  default_value_for :longitude, 139.78483870506284

  validates :name, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true

  mount_uploader :image, ImageUploader


  def image_url
    image.present? ? image.url : '/noimage.png'
  end

  def thumnail_url
    image.present? ? image.thumb.url : '/noimage.png'
  end
end
