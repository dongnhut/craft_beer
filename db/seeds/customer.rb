require 'ffaker'

ActiveRecord::Base.transaction do
  
  Customer.destroy_all
  
  puts "Create admin ....."
  40.times do |i|
    Customer.create!(
      email: "customer#{i}@gmail.com",
      name: FFaker::Name.name,
      address: FFaker::Address.street_address + FFaker::Address.city,
      password: "12345678",
      )
  end

end