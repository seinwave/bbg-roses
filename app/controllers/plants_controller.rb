# frozen_string_literal: true

class PlantsController < ApiController
  def index
    @plants = Plant.all
    @cultivars = Cultivar.all
    @cultivargroups = CultivarGroup.all
    render json: @plants
  end

  def show
    @plant = Plant.find(params[:id])
    @cultivar = Cultivar.find(@plant.cultivar_id)
    @cultivargroup = CultivarGroup.find(@cultivar.cultivar_group_id)
    @sector = Sector.find(@plant.sector_id)

    plant_info = {name: @cultivar.name, bred_year: @cultivar.bred_year, breeder: @cultivar.breeder, group: @cultivargroup.name, sector: @sector.name}
    render json: plant_info
  end 
end
