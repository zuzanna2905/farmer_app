Rails.application.routes.draw do
  devise_for :users
  resources :fields
  resources :machines
  resources :chemicals
  resources :warehouses
  resources :employees
  authenticated :user do
    root 'fields#index', as: 'authenicated_root'
  end
  root 'pages#index'
end
