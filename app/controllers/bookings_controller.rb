# frozen_string_literal:true

class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @flight = Flight.find(params[:flight_id])
    @passengers = @booking.passengers
    params[:number_of_passengers].to_i.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.create!(booking_params)
    @booking.passengers.each do |passenger|
      PassengerMailer
        .booking_confirmed_email(passenger)
        .deliver_later
    end
    flash[:notice] = 'Flight booked!'
    redirect_to @booking
  end

  def show
    @booking = Booking.find(params[:id])
    @flight = @booking.flight
    @passengers = @booking.passengers
  end

  private

  def booking_params
    params
      .require(:booking)
      .permit(:flight_id, passengers_attributes: %i[id name email booking_id])
  end
end
