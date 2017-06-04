Rails.application.routes.draw do

  root to: 'pages#home'

  # Routes to pages controller
  get '/about', to: 'pages#about'
  get '/privacy', to: 'pages#privacy'
  get '/terms', to: 'pages#terms'
  get '/information', to: 'pages#information'

  # Routes to the contacts controller
  get '/contact', to: 'contacts#new'
  post '/contact', to: 'contacts#create'

  # Routes to users controller
  devise_for :users
  
end
