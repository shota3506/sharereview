class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Login'
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'Logout'
  end

end