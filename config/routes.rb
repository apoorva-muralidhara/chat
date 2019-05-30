Rails.application.routes.draw do
  resources :users, only: :create
  resources :authentications, only: :create

  mount ActionCable.server => '/chat'
end
