Rails.application.routes.draw do
  devise_for :users
  resources :fields
  resources :machines
  root 'pages#index'
end
