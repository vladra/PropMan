class ManagersController < ApplicationController

  # def index
  #   @managers = Manager.all
  # end

  def new
    @manager = Manager.new
  end

  def create
    @manager = Manager.new(manager_params)
    if @building.save
      redirect_to @manager
    else
      render :new
    end
  end

  def edit
    @manager = Manager.find(params[:id])
  end

  def update
    @manager = Manager.find(params[:id])
    @manager.update_attribute(manager_params)
    redirect_to @manager
  end

  def show
    @manager = Manager.find(params[:id])
  end

  private

  def manager_params
    params.require(:manager).permit(:first_name, :last_name, :email, :phone_number)
  end

end








