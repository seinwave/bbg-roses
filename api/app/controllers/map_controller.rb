class MapController < ApiController

    def index 
      @plants = Plant.all
      @sectors = Sector.all
      sectors_and_plants = {sectors: @sectors, plants: @plants}
      render json: sectors_and_plants
    end 

    def show
      @sector = Sector.find(params[:id])
      @plants_in_sector = Plant.where(sector_id: params[:id])
      sector_and_plants = {sector: @sector, plants: @plants_in_sector}
      render json: sector_and_plants
    end
end
