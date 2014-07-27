class Managers::SessionsController < Devise::SessionsController

	def create
		super
		if current_tenant
			sign_out current_tenant
		end
	end

protected

	def after_sign_in_path_for(resource)
		managers_path
	end

end
