class MapController < ApplicationController

    def index 
    @plants = Plant.all
    @sectors = Sector.all

    end 

    def show
    @sector = Sector.find(params[:id])

    @plants_in_sector = Plant.where(sector_id: params[:id])
    end
end