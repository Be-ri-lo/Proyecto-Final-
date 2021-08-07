Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
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
  
  resources :users do
    # collection do
    #   get 'dashboard'
    # end 
    resources :trainings
  end
  
  
  root 'home#index'
  
end
