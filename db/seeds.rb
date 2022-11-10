# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
case Rails.env
when "development"
    20.times{ |i| Facility.create(name: "Large Garage", address:"123 Sample St.", parking_spot: i) }
    10.times{ |i| Facility.create(name: "Small Lot", address:"127 Sample St.", parking_spot: i) }
    User.create(email: "admin@example.com", first_name: "Admin", last_name: "User")
    Owner.create(name: "John Cena", address: "1 Main St.", email:"john@example.com", phone: "555-123-4567")
    Vehicle.create(vin:"5XYKT3A12CG000000", year: "2012", make: "KIA", model: "Sorento", owner_id: 1)
end