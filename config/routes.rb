Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  get '/results', to: 'teams#results', as: 'results'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks", registrations: 'registrations' }
  devise_for :judges, :controllers => { registrations: 'registrations' }

  resources :judges
  resources :mentors
  get 'home/index'
  get 'slack', to: 'home#slack', as: 'slack'
  get 'slack_mentor', to: 'home#slack_mentor', as: 'slack_mentor'


  resources :users
  resources :teams
  resources :schools

  root 'home#index'


end
