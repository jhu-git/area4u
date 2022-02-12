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

  get '/dashboard', to: 'pages#dashboard'
  get '/profile', to: 'pages#profile'
  get '/newsletter', to: 'newsletters#new'
  post '/newsletter', to: 'newsletters#create'
  get '/newsletter/subscribed', to: 'newsletters#subscribed'

  get '/login', to: 'pages#login'
  get '/signup', to: 'pages#signup'

  get '/confirmation', to: 'pages#confirmation'
end
