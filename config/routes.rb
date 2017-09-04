Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    get '', to: 'main#index', as: '/'

    resources :trains do
      resources :wagons
      resources :coupe_wagons, :controller => 'wagons'
      resources :economy_wagons, :controller => 'wagons'
      resources :sleep_wagons, :controller => 'wagons'
      resources :sitting_wagons, :controller => 'wagons'
    end

    resources :railway_stations do
      patch :update_order_number, on: :member
      patch :update_arrival_time, on: :member
      patch :update_departure_time, on: :member
    end

    resources :tickets

    resources :routes
  end

  resources :tickets

  resource :search, only: [:show]
  #resources :wagons

  # resources :users do
  # end

  root 'searches#show#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
