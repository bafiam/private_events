class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find_by(id: params[:id])
    @upcoming_events = @user.upcoming_events
    @prev_events = @user.previous_events
  end

  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to login_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
