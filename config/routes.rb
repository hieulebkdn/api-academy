Rails.application.routes.draw do
  resources :courses
  resources :accounts
  resources :users
  get 'class-rooms', to: 'class_rooms#index'
  get 'class-rooms/:id', to: 'class_rooms#show'
  delete 'class-rooms/:id', to: 'class_rooms#destroy'
  post 'auth', to: 'authentication#authenticate'
  post 'change-password', to: 'password#update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
