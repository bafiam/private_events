Rails.application.routes.draw do
  get '/invite', to: 'bookings#new'
  post '/invite', to: 'bookings#create'
  root to: 'users#new'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]
  resources :events, only: [:new, :create, :show, :index]
  
end
