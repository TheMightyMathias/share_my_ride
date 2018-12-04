Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :trips
  get '/search', to: "trips#search", as: :search

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
