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

  protected

	def devise_parameter_sanitizer
    if resource_class == Tenant
      Tenant::ParameterSanitizer.new(Tenant, :tenant, params)
    elsif resource_class == Manager
      Manager::ParameterSanitizer.new(Manager, :manager, params)
    else
      super # Use the default one
    end
  end

end
