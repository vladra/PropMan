class Managers::SessionsController < Devise::SessionsController

protected

	def after_sign_in_path_for(resource)
		manager_path
	end

end
