require 'rails_helper'

RSpec.describe BookingsController, type: :controller do
  describe 'GET New' do
    it 'Load the Invitation page' do
      get :new
      expect(response).to render_template :new
    end
  end
  describe 'POST Create' do
    it 'Render the Invitation page with a flash' do
      post :create, params: { booking: { attendee_id: 1, attended_event_id: 1 } }

      expect(flash[:success]).to be_present
      expect(response).to render_template :new
    end
  end
end
