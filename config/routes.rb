Rails.application.routes.draw do 
  root 'static_pages#home'
  get 'cart/show'
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'sessions/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  get 'users/new'
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/about'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/confirm', to: 'sessions#confirm'
  get '/bookpage', to: 'sessions#bookpage'
  post '/shop', to: 'shops#create'
  post '/cartsubmit', to: 'orders#checkout'
  get '/index_user', to: 'cart_items#index_user'
  get '/shoppage', to: 'products#index_shop'
  get '/search', to: 'products#search'
  post 'products/:id/index_cate', to: 'products#index_cate', as: 'index_cate'
  get 'products/:id/showtocart', to: 'products#showtocart', as: 'showtocart'
  get 'shop_show',to: 'shops#show'
  get 'shopss/:id/show', to: 'shops#show', as: 'shop_showw'
  #get '/showtocart', to: 'products#showtocart'
  resources :products
  resources :users
  resources :shops
  resources :orders
  resources :categories
  resources :cart_sessions
  resources :cart_items
  resources :cart, only: [:show]
  resources :order_items ,only: [:create, :update, :destroy]
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :microposts, only: [:create, :destroy]

  #post 'order_items/:id/create', to: 'order_items#create', as: 'orderitem'
end
