class BookingsController < ApplicationController
  def new
    @invite = Booking.new
  end

  def create
    @invite = Booking.new(invite_params)
    if !query_check
      @invite.save
      flash.now[:success] = 'Your Invatation has been successfully sent'
    elsif @invite.attended_event_id == query_check.attended_event_id && \
          @invite.attendee_id == query_check.attendee_id
      flash.now[:warning] = 'Error!! User already invited!!'
    else
      flash.now[:danger] = 'Error!! Can\'t invite user'
    end
    render :new
  end

  private

  def invite_params
    params.require(:booking).permit(:attendee_id, :attended_event_id)
  end

  def query_check
    Booking.find_by(invite_params)
  end
end
