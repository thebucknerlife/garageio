class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.welcome_email(@user).deliver
      session[:user_id] = @user.id
      flash[:info] = ["Welcome to garage.io!"]
      redirect_to '/cars'
    else
      flash[:error] = @user.errors.full_messages
      redirect_to '/users/new'
    end
  end

private

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
end