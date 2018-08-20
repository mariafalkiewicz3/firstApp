Rails.application.routes.draw do 
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }, controllers: { registrations: "user_registrations" }
  resources :users
  resources :products do
    resources :comments
  end
  resources :orders, only: [:index, :show, :create, :destroy]
  root 'simple_pages#landing_page'
  get 'simple_pages/index'
  get 'simple_pages/about'
  get 'simple_pages/contact'
  get '/products', to: 'products#index'
  get '/orders', to: 'orders#index'
  post 'simple_pages/thank_you'
end