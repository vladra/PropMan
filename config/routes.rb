Rails.application.routes.draw do

  root "static#index"

  devise_for :managers, controllers: {
    sessions: 'managers/sessions',
    registrations: 'managers/registrations',
    passwords: 'managers/passwords'
  }

  resource :managers, only: [:show] do
    get "/buildings/requests", to: 'buildings#requests'
    put "/buildings/requests", to: 'buildings#approve'
    resources :issues
    resources :buildings
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
