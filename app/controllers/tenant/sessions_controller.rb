class Tenant::SessionsController < Devise::SessionsController

protected

	def after_sign_in_path_for(resource)
		tenant_path
	end

end
