Rails.application.routes.draw do 
  resources :products
  get 'simple_pages/contact'
  get 'simple_pages/about'
  root 'simple_pages#index'
end
