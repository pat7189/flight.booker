# frozen_string_literal: true

class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.integer :start_airport_id, null: false
      t.integer :end_airport_id, null: false
      t.datetime :start_datetime, null: false
      t.integer :flight_duration_minutes, null: false

      t.timestamps
    end
  end
end
