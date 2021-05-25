# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#saveTheWhales = Campaign.create(name: "Save the Whales", description: "Stop whaling", goal: "50,000")

saveTheSharks = Campaign.create(name: "Save the Sharks", description: "Stop shark fining", goal: "50,000")

saveTheOcean = Campaign.create(name: "Save the Ocean", description: "Stop plastic pollution", goal: "500,000")

saveTheOcean.save
#saveTheWhales.save
saveTheSharks.save