class ManagersController < ApplicationController

  before_action :authenticate_manager!

  def show
    @manager = current_manager
    @issues = @manager.issues.order('created_at desc').limit(5)
  end

end








