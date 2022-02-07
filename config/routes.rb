Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :bookings
  resources :properties
  resources :users, only: [:show]
  get '/properties', to: 'properties#index'
  get '/categories', to: 'pages#categories'
  get '/locations', to: 'pages#locations'
  get '/themes', to: 'pages#themes'
  get '/about', to: 'pages#about'
end
