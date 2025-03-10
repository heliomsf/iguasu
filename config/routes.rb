Rails.application.routes.draw do
  root 'places#index'
  resources :places, only: [:index, :show]
  resources :entries, only: [:index, :show]
end
