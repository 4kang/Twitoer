class UsersController < ApplicationController

  def show
    @new_tweet = Tweet.new
    @user = User.find(params[:id])
    @tweets = @user.tweets
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction, :user_id)
  end

end
