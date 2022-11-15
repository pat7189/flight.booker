# frozen_string_literal: true

class FlightSearch
  include ActiveModel::Model

  attr_accessor :date, :number_of_passengers, :start_airport_id, :end_airport_id

  validates :number_of_passengers, :start_airport_id, :end_airport_id, :date, presence: true
  validates :date, date: { after_or_equal_to: proc { Date.today } }
end
