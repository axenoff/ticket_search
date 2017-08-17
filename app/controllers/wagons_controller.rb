class WagonsController < ApplicationController
  before_action :set_wagon, only: [:show, :edit, :update, :destroy]

  def index
    @wagons = Wagon.all
  end

  def show
  end

  def new
    @wagon = Wagon.new
  end

  def edit
  end

  def create
    @trains = Train.all
    @wagon = Wagon.new(wagon_params)
    if @wagon.save
      redirect_to @wagon
    else
      render :new
    end
  end

  def update
    if @wagon.update(wagon_params)
      redirect_to @wagon
    else 
      render :edit
    end
  end

  def destroy
    @wagon.destroy
    redirect_to wagons_path
  end

private
  def set_wagon
    @wagon = Wagon.find(params[:id])
  end

  def wagon_params
    params.require(:wagon).permit(:train_id, :type, :bottom_seats, :top_seats, :side_bottom_seats, :side_top_seats, :sitting_places)
  end
end
