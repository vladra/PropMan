Rails.application.routes.draw do

  root "static#index"

  devise_for :managers, controllers: {
    sessions: 'managers/sessions',
    registrations: 'managers/registrations',
    passwords: 'managers/passwords'
  }

  get "/managers/settings", to: 'managers#settings'
  put "/managers/settings", to: 'managers#update_settings'

  resource :managers, only: [:show] do
    get "/buildings/requests", to: 'buildings#requests'
    resources :tenants, only: [:index] do
      put 'approve'
      resources :issues, only: [:index]
    end
    resources :buildings do
      resources :tenants, only: [:index]
    end
    resources :issues, only: [:index]
  end

  devise_for :tenants, controllers: {
    sessions: 'tenants/sessions',
    registrations: 'tenants/registrations',
    passwords: 'tenants/passwords'
  }

  get "/tenants/settings", to: 'tenants#settings'
  put "/tenants/settings", to: 'tenants#update_settings'
  get "/tenants/building", to: 'tenants#change_building'
  put "/tenants/building", to: 'tenants#update_building'
  resource :tenants, only: [:show] do
    resources :issues, only: [:index]
  end

  resources :issues do
    resources :comments
  end

end
