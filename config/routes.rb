Rails.application.routes.draw do
  resources :class_rooms
  resources :courses
  resources :accounts
  resources :users

  post 'auth', to: 'authentication#authenticate'
  post 'change-password', to: 'password#update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
