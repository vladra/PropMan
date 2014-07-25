Rails.application.routes.draw do

  root "static#index"

  devise_for :manager

  devise_for :tenant, controllers: {
    sessions: 'tenant/sessions',
    registrations: 'tenant/registrations',
    passwords: 'tenant/passwords'
  }

  get "/tenant/settings", to: 'tenants#settings'
  put "/tenant/settings", to: 'tenants#update_settings'
  get "/tenant/building", to: 'tenants#change_building'
  put "/tenant/building", to: 'tenants#update_building'
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
