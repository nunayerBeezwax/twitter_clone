class UsersController < ApplicationController

  def index
    @users = User.all
    render('users/index.html.erb')
  end

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Thanks for signing up!"
      redirect_to root_url
    else
      render new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
    render('users/show.html.erb')
  end

  def edit
    @user = User.find(params[:id])
    render('users/edit.html.erb')
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render('users/success.html.erb')
    else
      render('users/edit.html.erb')
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "Account Deleted"
    redirect_to root_url
  end

private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
