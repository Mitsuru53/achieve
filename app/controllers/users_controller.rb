class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @follower = @user.followers
    @followed_user = @user.followed_users
  end
end
