Rails.application.routes.draw do
  devise_for :users
  resources :fields
  resources :machines
  resources :chemicals
  root 'pages#index'
end
