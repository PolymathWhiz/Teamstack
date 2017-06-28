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

    resources :users, except: [:edit, :destroy, :create] do 
      get '/dashboard', to: 'users#dashboard'

      member do
        get :followers, :following
      end

    end
  end

  resources :search, only: :index

  match :follow, to: 'follows#create', as: :follow, via: :post
  match :unfollow, to: 'follows#destroy', as: :unfollow, via: :post
  
end
