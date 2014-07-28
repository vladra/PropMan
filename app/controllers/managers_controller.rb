class ManagersController < ApplicationController

  before_action :authenticate_manager!

  def show
    @manager = current_manager
    @issues = @manager.issues.order('created_at desc').limit(5)
  end

  def settings
  	@manager = current_tenant
  end

  def update_settings
  	@manager = current_tenant
  	@manager.update(manager_params)
  	redirect_to managers_path, notice: 'Settings successfully saved!'
  end

  private

  def managers_params
  	params.require(:managers).permit(:first_name, :last_name, :phone_number, :email)
  end

end








