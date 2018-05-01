Rails.application.routes.draw do 
  get 'simple_pages/contact'
  get 'simple_pages/about'
  root 'simple_pages#index'
end
