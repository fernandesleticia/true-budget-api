Rails.application.routes.draw do
  devise_for :users,
    controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }

  resources :transactions
  resources :groups
  resources :wallets
  resources :categories
end
