Rails.application.routes.draw do
  resources :activities
  resources :facilities
  resources :owners
  resources :vehicles
  get 'search' => 'vehicles#search'
  post 'vehicles/new_from_api' => 'vehicles#new_from_api'

  get 'vehicles/out/:id' => 'activities#new_out'
  get 'vehicles/in/:id' => 'activities#new_in'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: redirect('/search')
end
