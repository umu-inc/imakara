Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#index'
  get 'pages/show'
  resources :posts
  resources :profiles, except: [:destroy] 
end
