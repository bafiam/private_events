require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  user = {}
  describe 'GET New' do
    it 'Load the signup page' do
      get :new
      expect(response).to render_template :new
    end
  end
  describe 'POST Create' do
    it 'Redirect to show action when signup is successful' do
      post :create, params: { user: { name: 'john', email: 'example@com.com' } }
      user = User.last

      expect(response.content_type).to eq 'text/html; charset=utf-8'
      expect(response).to redirect_to login_path
    end
  end
  describe 'GET Show' do
    it 'Render the show page' do
      allow(@upcoming_events).to receive(:upcoming_events).and_return(nil)
      allow(@prev_events).to receive(:previous_events).and_return(nil)
      get :show, params: { id: user.id }

      expect(response).to render_template :show
      user.destroy
    end
  end
end
