Rails.application.routes.draw do

  devise_for :managers
  devise_for :tenants

  resources :tenants
  resources :managers
  resources :buildings
  resources :issues do
    resources :comments
  end

end
