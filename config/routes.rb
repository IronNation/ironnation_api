Rails.application.routes.draw do
  get 'home/index'

  resources :users
  resources :teams

  root 'home#index'
end
