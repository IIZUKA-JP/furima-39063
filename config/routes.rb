Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  resources :users

  resources :items , only: [:index, :new, :create, :show, :edit, :update, :destroy] do
   resources :purchaser_record , only: [:index, :create]
  end

end
