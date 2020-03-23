require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe 'GET New' do
    it 'Load the Create Event page' do
      get :new
      expect(response).to render_template :new
    end
  end
  describe 'POST Create' do
    it 'Test event creation by a user to be an Event object' do
      current_user = User.create(name: 'john', email: 'example@com.com')
      event = current_user.events.build(id: 1, name: 'Event', description: 'Event desc', date: Time.now)

      expect(event.class).to eq(Event)
    end
  end
  describe 'GET Show' do
    it 'Render the show page' do
      get :show, params: { id: 1 }

      expect(response).to render_template :show
    end
  end
  describe 'GET Index' do
    it 'Render the All Events page' do
      get :index

      expect(response).to render_template :index
    end
  end
end
