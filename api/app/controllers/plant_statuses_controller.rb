class PlantStatusesController < ApiController
  def index
    @plant_statuses = PlantStatus.all
    render json: @plant_statuses
  end

  def show
    @plant_status = PlantStatus.find(params[:id])
    render json: @plant_status
  end

  def new
    @article = Article.new
  end

  def create
    @plant_status = PlantStatus.new(plant_status_params)
    if @plant_status.save
      redirect_to @plant_status
    else
      render :error
    end
  end

  def edit
    @plant_status = PlantStatus.find(params[:id])
  end

  def update
    @plant_status = PlantStatus.find(params[:id])

    if @plant_status.update(plant_status_params)
      redirect_to @plant_status
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @plant_status = PlantStatus.find(params[:id])
    @plant_status.destroy

    redirect_to plant_statuses_path, status: :see_other
  end

  private

  def plant_status_params
    params.require(:plant_status).permit(:status, :plant_id)
  end
end
