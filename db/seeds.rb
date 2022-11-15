# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

airports = Airport.create([{ code: "CDG", name: "Charles de Gaulle Airport" },
                           { code: "SAW", name: "Istanbul Sabiha Gökçen International Airport" },
                           { code: "FRA", name: "Frankfurt Airport" },
                           { code: "GRU", name: "São Paulo/Guarulhos International Airport" },
                           { code: "SFO", name: "San Francisco International Airport" },
                           { code: "MEX", name: "Mexico City International Airport" },
                           { code: "JFK", name: "John F. Kennedy International Airport" },
                           { code: "MCO", name: "Orlando International Airport" },
                           { code: "CAN", name: "Guangzhou Baiyun International Airport" },
                           { code: "LAS", name: "Harry Reid International Airport" },
                           { code: "MIA", name: "Miami International Airport" },
                           { code: "DEL", name: "Indira Gandhi International Airport" },
                           { code: "SVO", name: "Sheremetyevo International Airport" },
                           { code: "HOR", name: "Horgsholt International Airport" }])
100.times do
  flight = FlightCreator.call
  Flight.create(start_airport_id: flight.start_airport_id, end_airport_id: flight.end_airport_id,
                start_datetime: flight.start_datetime, flight_duration_minutes: flight.flight_duration_minutes)
end

bookings = Booking.create([{ flight_id: 1 },
                           { flight_id: 2 },
                           { flight_id: 2 }])
passengers = Passenger.create([{ name: "Michael", email: "michael@gmail.com" },
                               { name: "David", email: "david@gmail.com" },
                               { name: "Nicholas", email: "nicholas@gmail.com" },
                               { name: "Lewis", email: "lewis@gmail.com" }])

bookings[0].passengers << passengers[0]
bookings[0].passengers << passengers[1]
bookings[0].passengers << passengers[2]
bookings[0].passengers << passengers[3]

bookings[1].passengers << passengers[0]
bookings[1].passengers << passengers[1]

bookings[2].passengers << passengers[2]
bookings[2].passengers << passengers[3]
