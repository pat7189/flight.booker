# frozen_string_literal: true

class Passenger < ApplicationRecord
  belongs_to :booking, inverse_of: :passengers
  has_many :flights, through: :bookings

  validates :name, :email, presence: true
end
