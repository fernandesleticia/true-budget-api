Rails.application.routes.draw do
  resources :transactions
  resources :groups
  resources :wallets
  resources :categories
  resources :category_budgets
end
