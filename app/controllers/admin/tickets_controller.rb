class Admin::TicketsController < Admin::BaseController
  before_action :set_ticket, only: [:show, :destroy, :edit, :update]
  before_action :set_search_params, only: [:new, :create]

  def index
    @tickets = Ticket.all
  end

  def show
  end

  def new
    @ticket = Ticket.new
  end

  def edit
  end

  def create
    @ticket = current_user.tickets.new(ticket_params)
    if @ticket.save
      redirect_to [:admin, @ticket]
    else
      render 'new'    
    end
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to [:admin, @ticket]
    else 
      render :edit
    end
  end

  def destroy
    @ticket.destroy
    redirect_to admin_tickets_path
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