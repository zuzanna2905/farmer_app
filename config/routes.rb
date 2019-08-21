Rails.application.routes.draw do
  devise_for :users
  resources :fields
  resources :machines
  resources :chemicals
  resources :warehouses
  resources :employees
  resources :events
  authenticated :user do
    root 'fields#index', as: 'authenicated_root'
  end
  get 'calculator', to: 'pages#calculator'
  root 'pages#index'
end
