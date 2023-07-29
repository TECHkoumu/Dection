Rails.application.routes.draw do
  devise_for :users
  root to: 'emotions#index'
  resources :emotions, only: [:index, :new, :create]
  resources :actions, only: [:new, :create]
end
