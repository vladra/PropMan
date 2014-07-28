class Tenants::RegistrationsController < Devise::RegistrationsController

  def update_account_info
    account_update_params = devise_parameter_sanitizer.sanitize(:update_account_info)
    # required for settings form to submit when password is left blank
    if account_update_params[:password].blank?
      account_update_params.delete("password")
      account_update_params.delete("password_confirmation")
    end

    @tenant = Tenant.find(current_tenant.id)
    if @tenant.update_attributes(account_update_params)
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case their password changed
      sign_in @tenant, :bypass => true
      redirect_to after_update_path_for(@tenant)
    else
      render "/tenants/settings"
    end
  end

protected

  def after_sign_up_path_for(resource)
    tenants_path
  end

  def after_update_path_for(resource)
    tenants_path
  end

end
