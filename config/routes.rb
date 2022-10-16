Rails.application.routes.draw do
  # 顧客用
  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  namespace :public do
    root to: 'homes#top'
    get '/about', to: 'homes#about', as: 'about'
    resources :items, only: [:index, :show]
    resources :customers, only: [:show, :edit, :update]
    get '/customers/:id/unsubscribe', to: 'customers#unsubscribe', as: 'unsubscribe'
    patch '/customers/:id/withdraw', to: 'customers#withdraw', as: 'withdraw'
    resources :cart_items, only: [:index]
    resources :orders, only: [:new, :index, :show, :comfilm, :complete]
    resources :addresses, only: [:index, :edit]
  end

  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
  }

  namespace :admin do
    root 'homes#top'
    resources :orders, only: [:show]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:new, :create, :show, :index, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
  end

  # devise_for :admins
  # devise_for :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
