# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "destroy old seeds"
Ingredient.destroy_all
Cocktail.destroy_all

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
json_serialized = open(url).read
json = JSON.parse(json_serialized)

puts "starting seeding"
json["drinks"].each do |ingredient|
  name = ingredient["strIngredient1"]
  Ingredient.create(name: name)
end

Cocktail.create(name: "London Mule")
Cocktail.create(name: "Amaretto Sour")
Cocktail.create(name: "Gin Tonic")
Cocktail.create(name: "Bloody Mary")
Cocktail.create(name: "Tequila Sunrise")
puts "seeding finished"
