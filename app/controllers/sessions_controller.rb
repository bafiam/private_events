class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash.now[:danger] = 'Invalid email combination'
      render :new
    end
  end

  def destroy
    @current_user = nil
    redirect_to login_path
  end
end
