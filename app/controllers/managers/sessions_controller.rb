class Managers::SessionsController < Devise::SessionsController

protected

	def after_sign_in_path_for(resource)
		managers_path
	end

end
