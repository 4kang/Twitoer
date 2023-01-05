class Tweet < ApplicationRecord

  has_one_attached :image
  belongs_to :user

  # いいね
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user

  # いいねしてるか否かという条件分岐のメソッド定義
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def get_image
    if image.attached?
      image
    else
      'no_image.jpg'
    end
  end

end
