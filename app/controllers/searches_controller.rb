class SearchesController < ApplicationController
  def show
    @params = Route.show_result_params(params[:start_station_id], params[:finish_station_id])
  end
end
