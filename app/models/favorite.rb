class Favorite < ApplicationRecord

  # アソシエーション
  belongs_to :user
  belongs_to :tweet

  # １つの投稿に対して、１つしかいいねをつけられるようにするバリデーション
  validates_uniqueness_of :tweet_id, scope: :user_id

end
