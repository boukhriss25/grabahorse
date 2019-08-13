class HorsesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_horse, only: [:show, :edit, :update, :destroy]

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
