class Tenants::SessionsController < Devise::SessionsController

protected

	def after_sign_in_path_for(resource)
		tenants_path
	end

end
