# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning database...'
Dose.destroy_all
Ingredient.destroy_all
Cocktail.destroy_all

puts 'Creating data...'

5.times do
cocktail = Cocktail.create!(
  name: Faker::Hipster.sentence(2)
)

  4.times do
  ingredient = Ingredient.create!(
    name: Faker::Food.ingredient
  )
    1.times do
      dose = Dose.create!(
        description: Faker::Number.between(1, 10),
        cocktail_id: cocktail.id,
        ingredient_id: ingredient.id
      )
    end
  end
end

puts 'Finished!'
