Rails.application.routes.draw do
  devise_for :users
  root to: 'horses#search'
  resources :horses
  get "/dashboard", to: "dashboard#show"
  get "/search", to: "horses#search"
  resources :bookings, only: [:show, :create, :destroy]



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
