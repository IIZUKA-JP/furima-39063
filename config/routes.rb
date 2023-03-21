Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  resources :items, only: :edit
  resources :users, only: :new
end
