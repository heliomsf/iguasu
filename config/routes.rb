Rails.application.routes.draw do
  root 'entries#index'
  resources :places, only: [:index, :show]
  resources :entries, only: [:index, :show]
end
