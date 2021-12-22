Rails.application.routes.draw do
  namespace :admin do
    get 'orders/index'
    get 'orders/show'
  end
  root to: 'customer/homes#top'

  namespace :customer do
    get 'homes/top'
    get 'homes/about'
    resources :orders
    get 'orders/confirmation'
    get 'orders/message'
    resources :customers,only: [:show, :edit, :update]
    get '/customers/:id/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    patch '/customers/:id/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
    resources :items
    resources :addresses,only: [:index,:create,:edit,:update,:destroy]
    resources :cart_items,only: [:index,:update,:create,:destroy] do
      collection do
        delete '/' => 'cart_items#destroy_all'
      end
    end
  end

  namespace :admin do
    resources :genres
    resources :items
    resources :orders
    post 'items/new'
    resources :customers, only: [:show, :index, :edit, :update, :destroy]
  end

  devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  devise_for :customers,　skip: [:passwords,], controllers: {
  registrations: "customer/registrations",
  sessions: 'customer/sessions'
}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end