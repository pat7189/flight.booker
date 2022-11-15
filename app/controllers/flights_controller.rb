# frozen_string_literal: true

class FlightsController < ApplicationController
  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
  def index
    if params[:flight_search]
      @flight_search = assign_flight_search(params[:flight_search])
      if @flight_search.valid?
        @flights = Flight.all.match_search(params[:flight_search], @flight_search.date)
        @number_of_passengers = @flight_search.number_of_passengers
        respond_to do |format|
          flash[:notice] = ('No matching flights available' if @flights.blank?)
          format.html { render 'index' }
        end
      else
        respond_to do |format|
          flash.now[:notice] = 'Invalid search criterias'
          format.html { render 'index' }
        end
      end
    end
    @flight_search = FlightSearch.new
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength

  private

  def assign_flight_search(params)
    @flight_search ||= FlightSearch.new(flight_search_params)
    @flight_search.date = helpers.convert_dates_to_datetime(params[:date])
    @flight_search.number_of_passengers = params[:number_of_passengers]
    @flight_search
  end

  def flight_search_params
    params.require(:flight_search).permit(:number_of_passengers, :date, :start_airport_id, :end_airport_id)
  end
end
