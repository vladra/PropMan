class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	# def is_tenant?
	# 	current_user.is_a? Tenant
	# end

	# def is_manager?
	# 	current_user.is_a? Manager
	# end

end
