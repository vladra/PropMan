class Tenants::SessionsController < Devise::SessionsController

	# def create
	# 	super
	# 	if current_manager
	# 		sign_out current_manager
	# 	end
	# end

protected

	def after_sign_in_path_for(resource)
		tenants_path
	end

end
