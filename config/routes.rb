Rails.application.routes.draw do 
  resources :products
  get 'simple_pages/contact'
  get 'simple_pages/about'
  root 'simple_pages#landing_page'
end

Rails.application.routes.draw do 
  resources :orders, only: [:index, :show, :create, :destroy]
  get 'simple_pages/contact'
  get 'simple_pages/about'
  root 'simple_pages#landing_page'
end