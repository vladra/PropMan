class Tenants::RegistrationsController < Devise::RegistrationsController

protected

  def after_sign_up_path_for(resource)
    tenants_path
  end

  def after_update_path_for(resource)
    tenants_path
  end

end
