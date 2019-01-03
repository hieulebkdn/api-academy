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
  put 'class-rooms/:id', to: 'class_rooms#update'

  get 'timetables', to: 'timetables#index'
  get 'invoices', to: 'invoices#index'
  get 'invoices/:id', to: 'invoices#show'
  post 'invoices', to: 'invoices#create'
  delete 'invoices/:id', to: 'invoices#destroy'

  put 'course-classes/:id', to: 'courses#edit_class_rooms'

  get 'messages', to: 'messages#index'
  get 'messages/:id', to: 'messages#show'
  put 'messages/:id', to: 'messages#update'
  post 'messages', to: 'messages#create'
  delete 'messages/:id', to: 'messages#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
