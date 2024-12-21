Rails.application.routes.draw do
  resources :users

  resources :rooms do
    resources :bookings
  end

  get "bookings" => "bookings#list"

  get "signup" => "users#new"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
