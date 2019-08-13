class HorsesController < ApplicationController
  before_action :set_horse, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate, only: [:index, :show]
  def index
    @horses = Horse.all
  end

  def show
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
    if @horse.update(horse_strong_params)
      redirect_to horse_path(@horse)
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def set_horse
    @horse = Horse.find(params[:id])
  end

  def horse_params
    params.require(:horse).permit(:name, :location, :price, :description, :image)
  end
end
