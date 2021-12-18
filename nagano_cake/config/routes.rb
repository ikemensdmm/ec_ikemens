Rails.application.routes.draw do
  namespace :admin do
    resources :genres
    resources :items
    post 'items/new'
  end
  namespace :customer do
    resources :orders
    get 'orders/confirmation'
    get 'orders/message'
    resources :items
    resources :addresses,only: [:index,:create,:edit,:update,:destroy]
  end
  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
