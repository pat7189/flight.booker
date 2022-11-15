# frozen_string_literal:true

class Flight < ApplicationRecord
  belongs_to :start_airport, class_name: "Airport", inverse_of: :departing_flights
  belongs_to :end_airport, class_name: "Airport", inverse_of: :arriving_flights
  has_many :bookings, dependent: nil
  has_many :passengers, through: :bookings

  validates :start_airport_id, :end_airport_id, :start_datetime, :flight_duration_minutes, presence: true

  def self.match_search(params, date)
    start_airport_id = params[:start_airport_id].to_i
    end_airport_id = params[:end_airport_id].to_i
    where("start_airport_id = :start_airport_id and
                 end_airport_id = :end_airport_id and start_datetime >= :date",
          { start_airport_id: start_airport_id,
            end_airport_id: end_airport_id,
            date: date })
  end
end
