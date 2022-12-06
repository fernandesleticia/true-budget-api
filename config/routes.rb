Rails.application.routes.draw do
  resources :transactions
  resources :groups
  resources :wallets
  resources :categories
end
