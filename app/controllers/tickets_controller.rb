class TicketsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]

  def index
    @tickets = Ticket.all
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def new
    @ticket = current_user.tickets.new
  end

  def edit
  end

  def create
    @stations = RailwayStation.all
    @ticket = current_user.tickets.new(ticket_params)
    if @ticket.save
      redirect_to @ticket
    else
      redirect_to search_path
    end
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to @ticket
    else 
      render :edit
    end
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_path
  end

private
  def ticket_params
    params.require(:ticket).permit(:first_name, :middle_name, :last_name, :start_station_id, :finish_station_id)
  end
end
