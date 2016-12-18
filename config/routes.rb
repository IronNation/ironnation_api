Rails.application.routes.draw do
  devise_for :judges, :controllers => { registrations: 'registrations' }

  resources :judges
  resources :mentors
  get 'home/index'
  get 'slack', to: 'home#slack', as: 'slack'

  resources :users
  resources :teams
  resources :schools

  root 'home#index'


end
