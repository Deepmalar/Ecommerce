Rails.application.routes.draw do
  #devise_for :users
  #devise_for :users, :controllers => {:registrations => "users/registrations"}
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  resources :users
  resources :addresses
  resources :categories
  resources :products
  resources :orders
  root  to: 'users#index'
  #root  to: 'products#index'
end
