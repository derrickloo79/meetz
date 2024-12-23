Rails.application.routes.draw do
  resources :users

  resources :rooms do
    resources :bookings
  end

  resource :session, only: [:new, :create, :destroy]

  get "bookings" => "bookings#list"

  get "signup" => "users#new"

  get "signin" => "sessions#new"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
