Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  
  resources :trainings do
    resources :rateds, except: [:index]
  end
  
  resources :partners
  
  resources :places do
    resources :trainings
  end
  
  resources :users
  resources :profiles
  
  
  root 'home#index'
  
end
