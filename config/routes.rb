Rails.application.routes.draw do
  root to: 'products#index'
  resources :products, only: [:index, :show]
  resources :categories, only: [:show]
  resources :users, only: [:edit, :update]
  resource :cart, only: [:show] do
    post   :add_item
    post   :remove_item
  end
 
  resources :orders, only: [:create, :show]
  
  post 'cart/remove_product/:product_id', to: 'carts#remove_product', as: 'remove_product_cart'

  namespace :admin do
    root to: 'dashboard#show'
    resources :products
    resources :categories
  end

  get '/about' => 'about#index'

  # These routes are for showing users a login form, logging them in, and logging them out.
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy', as: :logout


  # These routes are for signup. The first renders a form in the browser, the second will 
  # receive the form and create a user in our database using the data given to us by the user.
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
end
 