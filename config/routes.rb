Rails.application.routes.draw do
  devise_for :users

  resources :categories, only: [:index, :new, :create]
  resources :expenses, only: [:show, :new, :create]

  get 'add_expense/:category_name', to: 'expenses#index', as: 'add_expense'

  root "home#index"
end
