class TenantsController < ApplicationController
	before_action :authenticate_tenant!

  def show
  	@tenant = current_tenant
  end

  def settings
  	@tenant = current_tenant
  end

  def update_settings
  	@tenant = current_tenant
  	@tenant.update(tenant_params)
  	redirect_to tenant_path, notice: 'Settings successfully saved!'
  end

  def change_building

  end

private

	def tenant_params
		params.require(:tenant).permit(:first_name, :last_name, :phone_number)
	end

end
