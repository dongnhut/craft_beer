ActiveRecord::Base.transaction do
  User.destroy_all
  puts "Create admin ....."
  
  User.create!(
      email: "admin@gmail.com",
      name: FFaker::Name.name,
      address: FFaker::Address.street_address + FFaker::Address.city,
      password: "12345678",
      )

  20.times do |i|
    User.create!(
      email: "admin#{i}@gmail.com",
      name: FFaker::Name.name,
      address: FFaker::Address.street_address + FFaker::Address.city,
      password: "12345678",
      )
  end
end