Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :trips
  get '/search_results', to: "trips#search_results", as: :search_results
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
