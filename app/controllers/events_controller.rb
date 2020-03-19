class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    p @event
    return unless @event.save

    redirect_to event_url(@event)
  end

  def show
    @event = Event.find_by(id: params[:id])

  end

  def index
    @event = Event.all
  end

  private

  def event_params
    params.require(:event).permit(:id, :name, :description, :date)
  end
end
