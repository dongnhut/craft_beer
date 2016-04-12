ActiveRecord::Base.transaction do
  Beer.destroy_all
  puts "Create admin ....."
  50.times do |i|
    Beer.create!(
      name: FFaker::Name.name,
      category_id: rand(1..Category.count),
      manufacturer: FFaker::Company.name,
      country: FFaker::Address.country,
      price: rand(11.2...76.9),
      description: FFaker::Lorem.paragraphs,
      )
  end
end