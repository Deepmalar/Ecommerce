Rails.application.routes.draw do
  #get 'home/index'
  #devise_for :users
  #devise_for :users, :controllers => {:registrations => "users/registrations"}
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  
  post 'add_to_cart', to: 'carts#add_to_cart'
  resource :home
  resources :users
  resources :addresses
  resources :categories
  resources :products
  resources :orders
  root to: 'products#index'
  #root to: 'home#index'
  #root  to: 'users#index'
end
