Rails.application.routes.draw do
  devise_for :users

  resources :categories
  resources :expenses, except: [:index]

  get 'add_expense/:category_name', to: 'expenses#index', as: 'add_expense'

  root "home#index"
end
