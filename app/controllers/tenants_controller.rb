class TenantsController < ApplicationController
	before_action :authenticate_tenant!, except: [:approve, :index]

  def index
    if current_manager
      if params[:building_id]
        @building = Building.find(params[:building_id])
        @tenants = @building.approved_tenants.order(:apartment)
      else
        @tenants = current_manager.approved_tenants
      end
    else
      redirect_to managers_path, alert: "You dont have permissions!"
    end
  end

  def show
  	@tenant = current_tenant
  end

  def settings
  	@tenant = current_tenant
  end

  def update_settings
  	@tenant = current_tenant
  	@tenant.update(tenant_params)
  	redirect_to tenants_path, notice: 'Settings successfully saved!'
  end

  def change_building
  	@tenant = current_tenant
  end

  def update_building
  	@tenant = current_tenant
  	@tenant.update(building_params)
  	redirect_to tenants_path, notice: 'Request successfully sent! Aproval can take some times, please check later..'
  end

  def approve
    tenant = Tenant.find(params[:tenant_id])
    if params[:commit] == 'approve'
      tenant.is_approved = true
    elsif params[:commit] == 'decline'
      tenant.is_approved = false
    end
    tenant.save
    redirect_to buildings_requests_managers_path, notice: "#{tenant.full_name} has been approved for #{tenant.building.full_address}, apartment: #{tenant.apartment}"
  end

private

	def tenant_params
		params.require(:tenant).permit(:first_name, :last_name, :phone_number)
	end

	def building_params
		params.require(:tenant).permit(:building_id, :apartment)
	end

end
