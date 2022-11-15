# frozen_string_literal: true

class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.integer :flight_id

      t.timestamps
    end
  end
end
