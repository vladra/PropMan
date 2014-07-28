Rails.application.routes.draw do

  root "static#index"

  ###################
  # MANAGERS ROUTES #

  devise_for :managers, skip: [:registrations], controllers: {
    sessions: 'managers/sessions',
    passwords: 'managers/passwords'
  }
  devise_scope :manager do
    resource :registration,
      only: [:new, :create, :edit, :update],
      path: 'managers',
      path_names: { new: 'sign_up' },
      controller: 'managers/registrations',
      as: :manager_registration do
        # get :cancel
      end
  end

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

  devise_for :tenants, skip: [:registrations], controllers: {
    sessions: 'tenants/sessions',
    registrations: 'tenants/registrations',
    passwords: 'tenants/passwords'
  }
  devise_scope :tenant do
    resource :registration,
      only: [:new, :create, :edit, :update],
      path: 'tenants',
      path_names: { new: 'sign_up' },
      controller: 'tenants/registrations',
      as: :tenant_registration do
        # get :cancel
      end
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
