Rails.application.routes.draw do
  root to: 'customer/homes#top'

  namespace :customer do
    get 'homes/top'
    get 'homes/about'
    delete 'cart_items/destroy_all' => 'cutomer/cart_items#destroy_all'
    resources :orders
    get 'orders/confirmation'
    get 'orders/message'
    resources :items
    resources :addresses,only: [:index,:create,:edit,:update,:destroy]
    resources :cart_items,only: [:index,:create,:update,:destroy]
  end

  namespace :admin do
    resources :genres
    resources :items
    resources :customers, only: [:show, :index, :edit, :update, :destroy]
  end

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  devise_for :customers,　skip: [:passwords,], controllers: {
  registrations: "customer/registrations",
  sessions: 'customer/sessions'
}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
