Rails.application.routes.draw do
  resources :activities
  resources :facilities
  resources :owners
  resources :vehicles
  get 'search' => 'vehicles#search'
  post 'vehicles/new_from_api' => 'vehicles#new_from_api'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
