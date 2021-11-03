Rails.application.routes.draw do
  #get 'home/index'
  #devise_for :users
  #devise_for :users, :controllers => {:registrations => "users/registrations"}
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  #post 'add_to_cart', to: 'carts#add_to_cart'

  get 'carts/:id' => "carts#show", as: "cart"
  delete 'carts/:id' => "carts#destroy"

  post 'line_items/:id/add' => "line_items#add_quantity", as: "line_item_add"
  post 'line_items/:id/reduce' => "line_items#reduce_quantity", as: "line_item_reduce"
  post 'line_items', to: 'line_items#create'
  get 'line_items/:id' => "line_items#show", as: "line_item"
  delete 'line_items/:id' => "line_items#destroy"

  resource :home
  resources :addresses
  resources :users, :categories, :products, :orders
  root to: 'products#index'
  
end
