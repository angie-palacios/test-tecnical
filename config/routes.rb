Rails.application.routes.draw do

  resources :permissions
  resources :rols
  resources :populations
  resources :profiles do
    member do
      post 'edit_status_permission'
    end
  end
  resources :activities
  get 'home/index'

  root to: "home#index"

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
