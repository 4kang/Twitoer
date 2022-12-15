class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :tweets, dependent: :destroy

      # アイコン画像
      # 画像が存在しない場合に表示する画像をActiveStorageに格納する
  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end

end
