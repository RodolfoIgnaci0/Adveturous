Rails.application.routes.draw do

  resources :profiles, only: [:show,:edit,:update]
  resources :landings, only: [:index]
  resources :countries, only: [:index]
  devise_for :users

  root 'landings#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
