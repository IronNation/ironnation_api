Rails.application.routes.draw do
  resources :mentors
  get 'home/index'

  resources :users
  resources :teams

  root 'home#index'
end
