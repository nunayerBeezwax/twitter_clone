class FollowingsController < ApplicationController
  def new
    @followed_user = User.find(params[:user_id])
    @follower = User.find(params[:follower_id])
    @following = Following.new
  end

  def create
    @following = Following.new(:user_id => params[:user_id], :follower_id => current_user.id)
    if @following.save
      flash[:notice] = "User Followed"
      redirect_to user_path(current_user)
    else
      flash[:error] = "Unable to Follow"
      redirect_to root_url
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @following = current_user.followings.find(params[:id])
    @following.destroy
    flash[:notice] = "Unfollowed"
    redirect_to current_user
  end
end
