Rails.application.routes.draw do
  devise_for :users
  resources :fields
  resources :machines
  resources :chemicals
  resources :warehouses
  resources :employees
  root 'pages#index'
end
