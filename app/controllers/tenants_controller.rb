class TenantsController < ApplicationController
  def show
  	@tenant = current_tenant
  end
end
