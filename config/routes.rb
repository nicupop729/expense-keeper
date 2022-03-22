Rails.application.routes.draw do
  get 'pages/index', to: 'pages#index'
  devise_for :users
  resources :categories
  resources :expenses
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#index"
end
