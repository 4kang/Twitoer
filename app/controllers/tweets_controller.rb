class TweetsController < ApplicationController

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    @tweet.save
    redirect_to home_path
  end

  def index
    @tweet = Tweet.new
    @tweets = Tweet.all.order(created_at: :desc)
    @user = current_user
    @users = User.all
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to  home_path
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body, :image, :profile_image, :user_id)
  end

end
