Rails.application.routes.draw do

  root "static#index"

  devise_for :manager
  devise_for :tenant

  resource :tenant, only: [:show] do
  	resources :issues, only: [:index]
  end
  # resource :manager, only: [:show] do
  # 	resources :buildings, on: :collection
  # end
  resources :managers
  resources :buildings
  resources :categories
  resources :issues do
    resources :comments
  end

end
