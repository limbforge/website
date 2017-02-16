Rails.application.routes.draw do
  resources :categories
  devise_for :users
  resources :posts do
    resources :comments
  end
  resources :contacts, only: [:new, :create]

  get '/about', to: 'pages#about'
  get '/dashboard', to: 'pages#dashboard'
  get '/users', to: 'pages#userlist', as: :user_list

  get '/sayhey', to: 'contacts#new'

  get '/sayhey-thanks', to: 'contacts#create'

  get 'privacy', to: 'pages#privacy', as: :privacy

  get 'terms', to: 'pages#terms', as: :terms

  devise_scope :user do
    # using login path for registration
    get '/meow', to: 'devise/sessions#new'
    get '/users/sign_out', to: 'devise/sessions#destroy'

  end
  root 'pages#home'
end
