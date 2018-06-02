Rails.application.routes.draw do 
  resources :products
  root 'simple_pages#about'
  get 'simple_pages/contact'
  get '/products', to: 'products#index'
  get '/orders', to: 'orders#index'
  get 'simple_pages/landing_page'
end

Rails.application.routes.draw do 
  resources :orders, only: [:index, :show, :create, :destroy]
  root 'simple_pages#about'
  get 'simple_pages/contact'
  get '/products', to: 'products#index'
  get '/orders', to: 'orders#index'
  get 'simple_pages/landing_page'
end