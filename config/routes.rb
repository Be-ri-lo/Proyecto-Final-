Rails.application.routes.draw do  
  resources :trainings
  
  resources :partners, only: [:new, :create, :destroy]
  
  resources :places do
    resources :trainings
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, controllers: { registration: 'user/registrations' }
  
  resources :users do
    collection do
       get 'dashboard'
    end 
    resources :trainings
  end

  root 'home#index'
end
