Rails.application.routes.draw do
  devise_for :users
  root to: 'horses#search'
  resources :horses do
    resources :bookings, only: [:new, :create]
  end
  get "/dashboard", to: "dashboard#show"
  patch "/bookings/:id", to: "bookings#confirm_booking", as: 'confirm_booking'
  # patch "/bookings/:id", to: "bookings#reject_booking", as: 'reject_booking'
  get "/search", to: "horses#search"
  resources :bookings, only: [:show, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
