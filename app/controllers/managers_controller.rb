class ManagersController < ApplicationController

  before_action :authenticate_manager!

  def show
    @manager = current_manager
  end

end








