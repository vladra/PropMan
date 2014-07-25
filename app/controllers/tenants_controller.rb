class TenantsController < ApplicationController
	before_action :authenticate_tenant!

  def show
  	@tenant = current_tenant
  end

  def settings
  	@tenant = current_tenant
  end

end
