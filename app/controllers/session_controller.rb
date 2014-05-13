class SessionController < ApplicationController

  def index
    @new_user = User.new
    if logged_in?
      render :index
    else
      render :welcome, layout: false
    end
  end

  def create
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to home_path
    else
      @new_user = User.new
      flash[:notice] = "That username or email is already in use"
      render :welcome , layout: false
    end
  end

  def facebook

  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
