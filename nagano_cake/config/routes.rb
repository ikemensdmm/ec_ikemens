Rails.application.routes.draw do

  
  # customer
  namespace :admin do
    resources :genres
    resources :items
    post 'items/new'
  end
  namespace :customer do
    resources :orders
    get 'orders/confirmation'
    get 'orders/message'
    resources :addresses,only: [:index,:create,:edit,:update,:destroy]
    
  end

  devise_for :admins
  devise_for :customers
  
  end
