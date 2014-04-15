class TweetsController < ApplicationController

  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
    @user = User.find(params[:format])
  end

  def create
    @tweet = Tweet.new(tweets_params)
    @tweet.user_id = params[:user_id]
    @tweet.save
    redirect_to :back
  end

  def show
    @user = User.find(params[:id])
    @tweet = Tweet.find(params[:id])
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id])
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    # session.clear
    # flash[:notice] = "Account Deleted"
    redirect_to root_url
  end

private
  def tweets_params
    params.require(:tweet).permit(:content, :user_id)
  end
end

