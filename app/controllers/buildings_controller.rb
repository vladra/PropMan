class BuildingsController < ApplicationController

  def new
    @building = Building.new
  end

  def create
    @building = Building.new(building_params)
  end

  def edit
    @building = Building.find(params[:id])
  end

  def update
    @building = Building.find(params[:id])
    if @building.save
      redirect_to company_path
    else
      render :new
    end
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
    params.require(:building).permit(:address)  
  end

end
