class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find_by(id: params[:id])
    # @upcoming_events = current_user.previous_events
    # @prev_events= current_user.upcoming_events
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end

  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end

end
