class HorsesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_horse, only: [:show, :edit, :update, :destroy]

  def markers(horses)
    @markers = horses.map do |horse|
      {
        lat: horse.latitude,
        lng: horse.longitude
        # infoWindow: render_to_string(partial: "infowindow", locals: { flat: flat }),
        # image_url: helpers.asset_url('REPLACE_THIS_WITH_YOUR_IMAGE_IN_ASSETS')
      }
    end
  end

  def index
    if params[:query].present?
      # sql_query = "location @@ :query OR description @@ :query"
      # @horses = Horse.geocoded
      @horses = Horse.near(params[:query], 25)
      markers(@horses)
    else
      @horses = Horse.all
      markers(@horses)
    end
  end

  def show
  end

  def search
    @horse = Horse.new
  end

  def new
    @horse = Horse.new
  end

  def create
    @horse = Horse.new(horse_params)
    @horse.user = current_user
    if @horse.save
      redirect_to horse_path(@horse)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @horse.update(horse_params)
      redirect_to horse_path(@horse)
    else
      render :edit
    end
  end

  def destroy
    @horse.destroy
    redirect_to root_path
  end

  private

  def set_horse
    @horse = Horse.find(params[:id])
  end

  def horse_params
    params.require(:horse).permit(:name, :location, :price, :description, :image)
  end
end
