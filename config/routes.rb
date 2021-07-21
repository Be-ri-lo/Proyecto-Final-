Rails.application.routes.draw do
  
  resources :trainings 
  resources :rateds
  resources :partners
  
  resources :places
  
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :users 
  resources :profiles
  

  root 'home#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
