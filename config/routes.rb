Rails.application.routes.draw do
  root 'application#home'
  resources :places, only: [:index, :show]
  resources :entries
end
