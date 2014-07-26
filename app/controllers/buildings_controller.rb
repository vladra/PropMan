class BuildingsController < ApplicationController

  def index
    # @buildings = Building.all
    @buildings = current_manager.buildings
  end

  def new
    if current_manager
      @building = Building.new
    end
  end

  def create
    if current_manager
      @building = Building.new(building_params)
      if @building.save
        redirect_to @building, :notice => "Building has been created"
      else
        render :new
      end
    end
  end

  def edit
    if current_manager
     @building = Building.find(params[:id])
    end
  end

  def update
    if current_manager
      @building = Building.find(params[:id])
      @building.update_attributes(building_params)
      redirect_to @manager, :notice => "Building has been updated"
    end
  end

  def show
    # @building = current_manager.building
    @building = Building.find(params[:id])
  end

  def destroy
    if current_manager
      @building = Building.find(params[:id])
      @building.destroy
      redirect_to company_path
    end
  end

  private

  def building_params
    params.require(:building).permit(:street, :postal_code, :city, :country, :company_id, :manager_id)
  end

end
