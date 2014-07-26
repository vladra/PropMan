class BuildingsController < ApplicationController

  # def index
  #   @buildings = Building.all
  # end

  def new
    @building = Building.new
  end

  def create
    @building = Building.new(building_params)
    if @building.save
      redirect_to @building, :notice => "Building has been created"
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

  def show
    @building = Building.find(params[:id])
  end

  def destroy
    @building = Building.find(params[:id])
    @building.destroy
    redirect_to company_path
  end

  private

  def building_params
    params.require(:building).permit(:street, :postal_code, :city, :country, :company_id, :manager_id)
  end

end
