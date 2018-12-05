Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :trips do
    resources :ridemates, shallow: true
  end
  get '/search', to: "trips#search", as: :search
  get 'profiles', to: 'profiles#show'

  get 'trips/:id/confirmation', to: "trips#confirmation", as: :confirmation
end
