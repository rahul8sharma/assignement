Rails.application.routes.draw do
  resources :transactions, only: [:index]

  root 'transactions#index'
end
