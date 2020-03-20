class BookingsController < ApplicationController
  def new
    @invite = Booking.new
  end

  def create
    @invite = Booking.create(invite_params)
    if @invite.save
      flash.now[:success] = 'Your Invatation has been successfully sent'
      redirect_to event_path(current_user) 
    else
      flash.now[:danger] = 'Error!! You invitation isn\'t sent'
      render :new
    end
  end

  private

  def invite_params
    params.require(:booking).permit(:attendee_id, :attended_event_id)
  end
end
