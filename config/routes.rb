Rails.application.routes.draw do
  get "search" => "searches#search"
  # 顧客用
  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  namespace :public do
    root to: 'homes#top'
    get '/about', to: 'homes#about', as: 'about'
    resources :items, only: [:index, :show]
    get '/customers/:id/unsubscribe', to: 'customers#unsubscribe', as: 'unsubscribe'
    patch '/customers/:id/withdraw', to: 'customers#withdraw', as: 'withdraw'
    resources :customers, only: [:show, :edit, :update]
    delete 'cart_items/destroy_all', as: 'destroy_all'
    resources :cart_items, only: [:index, :create, :update, :destroy]
    post '/orders/confilm', to: 'orders#comfilm', as: 'confilm'
    get '/orders/complete', to: 'orders#complete', as: 'complete'
    resources :orders, only: [:new, :index, :show, :create]
    resources :addresses, only: [:index, :create, :destroy, :edit, :update]
  end

  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
  }

  namespace :admin do
    root 'homes#top'
    patch 'orders/:order_id/order_details/:id', to: 'order_details#update', as: 'order_details'
    resources :orders, only: [:show, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:new, :create, :show, :index, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
  end

  # devise_for :admins
  # devise_for :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
