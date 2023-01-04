class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :tweets, dependent: :destroy

        # いいね
         has_many :favorites, dependent: :destroy
         has_many :favorited_tweets, through: :favorites, source: :tweet

        # いいねしてるか否かという条件分岐のメソッド定義
        def favorited_by?(tweet_id)
          favorites.where(tweet_id: tweet_id).exists?
        end

         has_one_attached :profile_image

      # アイコン画像
      # 画像が存在しない場合に表示する画像をActiveStorageに格納する
  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end
end
