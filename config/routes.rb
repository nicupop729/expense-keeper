Rails.application.routes.draw do
  get 'pages/index', to: 'pages#index'

  devise_for :users

  resources :categories
  resources :expenses, except: [:index]

  get 'add_expense/:category_name', to: 'expenses#index', as: 'add_expense'

  root "pages#index"
end
