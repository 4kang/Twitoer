class Tweet < ApplicationRecord

  has_one_attached :image
  belongs_to :user

  # いいね
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user

  def get_image
    if image.attached?
      image
    else
      'no_image.jpg'
    end
  end

end
