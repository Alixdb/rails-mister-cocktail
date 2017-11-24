# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'
require 'faker'

filepath = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

ingredient_list = open(filepath).read

ingredients = JSON.parse(ingredient_list)
# p ingredients

ingredients['drinks'].each do |aliment|
  Ingredient.create(name: aliment['strIngredient1'])
end

puts 'Creating cocktails...'
5.times do
  post = Cocktail.new(
    name: Faker::HeyArnold.character
  )
  post.save
end
puts 'Finished!'

