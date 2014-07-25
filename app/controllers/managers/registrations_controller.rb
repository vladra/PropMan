class Managers::RegistrationsController < Devise::RegistrationsController

	# Since we want managers to be able to edit and update some pieces of
	# information, WITHOUT having to enter their passwords again, we need to
	# override the default Devise update method, and not require passwords when editing.
  def update
    account_update_params = devise_parameter_sanitizer.sanitize(:account_update)
    # required for settings form to submit when password is left blank
    if account_update_params[:password].blank?
      account_update_params.delete("password")
      account_update_params.delete("password_confirmation")
    end

    @manager = Manager.find(current_manager.id)
    if @manager.update_attributes(account_update_params)
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case their password changed
      sign_in @manager, :bypass => true
      redirect_to after_update_path_for(@manager)
    else
      render "edit"
    end
  end

	protected

  def after_sign_up_path_for(resource)
    manager_path
  end

  def after_update_path_for(resource)
    manager_path
  end

end
