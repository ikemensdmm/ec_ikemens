Rails.application.routes.draw do

  
  # customer
  namespace :customer do
  	resources :addresses,only: [:index,:create,:edit,:update,:destroy]
  	
    end
    

  namespace :admin do
    resources :genres
  end
  namespace :customer do
    resources :orders
    get 'orders/confirmation'
    get 'orders/message'
  end

  devise_for :admins
  devise_for :customers
  
  end
