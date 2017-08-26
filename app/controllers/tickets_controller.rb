class TicketsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]
  before_action :set_ticket, only: [:show, :destroy]
  before_action :set_search_params, only: [:new, :create]

  def index
    if current_user.admin?
      @tickets = Ticket.all
    else
      @tickets = current_user.tickets.all
    end
  end

  def show
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = current_user.tickets.new(ticket_params)
    if @ticket.save
      redirect_to @ticket
    else
      render 'new'    
    end
  end

  def destroy
    @ticket.destroy if @ticket.user == current_user
    redirect_to tickets_path
  end

private
  def ticket_params
    params.require(:ticket).permit(:first_name, :middle_name, :last_name, :train_id, :start_station_id, :finish_station_id)
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def set_search_params
    @train = Train.find(params[:ticket][:train_id])
    @start_station = RailwayStation.find(params[:ticket][:start_station_id])
    @finish_station = RailwayStation.find(params[:ticket][:finish_station_id])
  end
end
