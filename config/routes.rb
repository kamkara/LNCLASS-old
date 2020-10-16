Rails.application.routes.draw do
  resources :materials
  resources :courses
  root to:'home#index'

  devise_for :users, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
