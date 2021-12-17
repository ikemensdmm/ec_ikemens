Rails.application.routes.draw do
  
  # customer
  namespace :customer do
  	resources :addresses,only: [:index,:create,:edit,:update,:destroy]
  	
    end
    
  devise_for :admins
  devise_for :customers
  
  end
