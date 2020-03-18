Rails.application.routes.draw do
  get '/signup', to: 'users#new'
  post'/signup',  to: 'users#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]
end
