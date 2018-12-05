Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :trips
  get '/search', to: "trips#search", as: :search
  get 'profiles', to: 'profiles#show'

  get '/confirmation', to: "trips#confirmation", as: :confirmation
end
