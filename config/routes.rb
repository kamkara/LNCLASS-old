Rails.application.routes.draw do
  resources :materials

  resources :courses do
    resources :exercices, only: [:index, :new, :create]
  end
  resources :exercices, only: [:show, :update, :edit, :destroy]
  root to:'home#index'

  devise_for :users, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
