Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :products
  root  to: 'users#index'
end
