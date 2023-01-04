class FavoritesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    Tweet.create(user_id: current_user.id, tweet_id: @tweet.id)
  end

  def destroy
    tweet = Tweet.find_by(user_id: current_user.id, tweet_id: @tweet.id)
    tweet.destroy
  end

  private
  def tweet_params
    @tweet = Tweet.find(params[:tweet_id])
  end

end
