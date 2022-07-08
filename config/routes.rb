Rails.application.routes.draw do

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }


  namespace :public do
    get 'homes/top'
    get 'homes/about'
    get '/public/customers/:id/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    patch '/public/customers/:id/withdraw' => 'customers#withdraw', as: 'withdraw'
    delete '/public/cart_items/destroy_all' => 'cart_items#destroy_all', as: 'destroy_all'
    post '/orders/confirm' => 'orders#confirm', as: 'confirm'
    # get '/orders/confirm' => 'orders#confirm', as: 'get_confirm'
    get 'orders/complete'
  end

  namespace :public do
    resources :customers, only:[:show, :edit, :update, :unsubscribe, :withdraw], controllers: {
       customers_show: "customers/my page"}

    resources :items, only:[:index, :show]
    resources :cart_items, only:[:index, :update, :destroy, :create]
    resources :addresses, only:[:index, :edit, :create, :update, :destroy]
    resources :orders, only:[:new, :index, :show, :create]
  end


  namespace :admin do
    get 'homes/top'
  end

  namespace :admin do
    resources :genres, only:[:index, :create, :edit, :update]
    resources :items, only:[:index, :new, :create, :show, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :orders, only:[:index, :show, :update]
    resources :order_details, only:[:update]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
