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

  devise_scope :users do
    get 'users/connections', to: 'users#connections'
    get 'users/account_log', to: 'users#account_log'
    
    resources :users, except: [:index, :edit, :destroy, :create] do       
      member do
        get :followers, :following
      end

    end
  end

  resources :search, only: :index
  
  get '/feedback', to: 'feedbacks#new'
  post '/feedback', to: 'feedbacks#create'

  match :follow, to: 'follows#create', as: :follow, via: :post
  match :unfollow, to: 'follows#destroy', as: :unfollow, via: :post
  
  # Admin section
  namespace :admin do
    root 'home#index'
    resources :contacts, only: [:index, :destroy]
    resources :feedbacks, only: [:index, :destroy]
    resources :users, only: [:index, :destroy]
  end
  
end
