Rails.application.routes.draw do

  resources :users
  resources :accounts
  post 'auth', to: 'authentication#authenticate'
  post 'change-password', to: 'password#update'

  get 'teachers', to: 'users#fetch_all_teachers'
  get 'students', to: 'users#fetch_all_students'

  resources :courses
  get 'class-rooms', to: 'class_rooms#index'
  get 'class-rooms/:id', to: 'class_rooms#show'
  post 'class-rooms', to: 'class_rooms#create'
  delete 'class-rooms/:id', to: 'class_rooms#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
