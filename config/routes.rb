Rails.application.routes.draw do
  resources :trains do
    resources :wagons
    resources :coupe_wagons, :controller => 'wagons'
    resources :economy_wagons, :controller => 'wagons'
    resources :sleep_wagons, :controller => 'wagons'
    resources :sitting_wagons, :controller => 'wagons'
  end
  resources :railway_stations do
    patch :update_order_number, on: :member
  end
  resources :routes
  #resources :wagons

  resources :tickets
  root 'railway_stations#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
