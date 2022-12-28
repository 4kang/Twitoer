class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    redirect_to user_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
