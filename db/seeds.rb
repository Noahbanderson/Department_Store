# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do

  dep = Department.create(dep_name: Faker::Company.name)
  10.times do 
    dep.items.create(
        item_name: Faker::Commerce.product_name,
        value: Faker::Commerce.price,
        brand: Faker::Commerce.department
    )
  end

end
