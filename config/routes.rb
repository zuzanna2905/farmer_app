Rails.application.routes.draw do
  devise_for :users
  resources :fields
  root 'pages#index'
end
