Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :trips do
    resources :ridemates, shallow: true
  end
  get '/search', to: "trips#search", as: :search
  get 'profiles', to: 'profiles#show'

  get 'trips/:id/confirmation', to: "trips#confirmation", as: :confirmation
  get 'trips/:id/chat', to: "trips#chat", as: :chat
  post 'trips/:trip_id/chat/messages', to: 'messages#create', as: :trip_messages

  mount ActionCable.server => "/cable"
end
