# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Deleting Shirt Fabrics'
ShirtFabric.destroy_all
puts 'Deleting Shirts'
Shirt.destroy_all
puts 'Deleting Fabrics'
Fabric.destroy_all

puts "Creating Shirts"
10.times do
  Shirt.create(
    name: Faker::Address.city,
    collar: %w[short long].sample,
    cuff: %w[short long].sample,
    placket: %w[yes no].sample,
    pocket: %w[none one two].sample,
    contrast_collar: %w[yes no].sample,
    about: Faker::Lorem.paragraphs(2, true),
    price_cents: rand(5..300) * 100,
    sku: "SG" + rand(0..999).to_s.rjust(3, '0')
  )
end

puts "Creating Fabrics"
5.times do
  Fabric.create(
    name: Faker::Cannabis.strain,
    mill: Faker::Address.city,
    origin: Faker::Address.country,
    color: Faker::Color.color_name,
    fabric_type: Faker::Commerce.material,
    about: Faker::Lorem.paragraphs(2, true)
  )
end

puts "Creating Shirt Fabrics"
Shirt.all.each do |shirt|
  Fabric.all.sample(rand(2..4)).each do |fabric|
    ShirtFabric.create(
      shirt: shirt,
      fabric: fabric
    )
  end
end


