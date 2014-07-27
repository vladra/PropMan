class BuildingsController < ApplicationController

  def index
    # @buildings = Building.all
    @buildings = current_manager.buildings
  end

  def show
    @building = Building.find(params[:id])
    @issues = @building.issues.limit(20)
  end

  def new
    @building = Building.new
  end

  def create
    @building = Building.new(building_params)
    @building.manager = current_manager
    if @building.save
      redirect_to managers_buildings_path, :notice => "Building has been created"
    else
      render :new
    end
  end

  def edit
    @building = Building.find(params[:id])
  end

  def update
    @building = Building.find(params[:id])
    @building.update_attributes(building_params)
    redirect_to @manager, :notice => "Building has been updated"
  end

  def requests
    @requests = current_manager.not_approved
  end

private

  def building_params
    params.require(:building).permit(:street, :postal_code, :city, :country)
  end

end
