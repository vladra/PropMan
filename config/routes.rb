Rails.application.routes.draw do

  devise_for :manager
  devise_for :tenant

  resource :tenant, only: [:show, :edit, :update] do
  	get 'edit', on: :collection
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
