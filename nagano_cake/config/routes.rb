Rails.application.routes.draw do

  namespace :customer do
    get 'homes/top'
    get 'homes/about'
    resources :orders
    get 'orders/confirmation'
    get 'orders/message'
    resources :customers
    resources :items
    resources :addresses,only: [:index,:create,:edit,:update,:destroy]
  end

  namespace :admin do
    resources :genres
    resources :items
    post 'items/new'
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
