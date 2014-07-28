Rails.application.routes.draw do

  root "static#index"

  ###################
  # MANAGERS ROUTES #

  devise_for :managers, skip: [:registrations], controllers: {
    sessions: 'managers/sessions',
    passwords: 'managers/passwords'
  }
  as :manager do
    resource :registration, only: [:new, :create, :edit, :update], controller: 'managers/registrations'
  end

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

  ##################
  # TENANTS ROUTES #

  devise_for :tenants, controllers: {
    sessions: 'tenants/sessions',
    registrations: 'tenants/registrations',
    passwords: 'tenants/passwords'
  }
  as :tenant do
    resource :registration, only: [:new, :create, :edit, :update], controller: 'tenants/registrations'
  end

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
