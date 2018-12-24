Rails.application.routes.draw do
  resources :courses
  resources :accounts
  resources :users

  post 'auth', to: 'authentication#authenticate'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
