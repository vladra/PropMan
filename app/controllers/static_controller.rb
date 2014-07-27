class StaticController < ApplicationController

	def index
		if current_tenant
			redirect_to tenants_path
		elsif current_manager
			redirect_to managers_path
		else
			render layout: 'landing_page'
		end
	end

end
