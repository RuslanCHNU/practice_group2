Rails.application.routes.draw do
  resources :transactions, only: [:index, :create, :destroy]
  root to: 'transactions#index'
end
