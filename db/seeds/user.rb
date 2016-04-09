ActiveRecord::Base.transaction do
  User.destroy_all
  puts "Create users ....."
  User.create!(
      email: "admin@gmail.com",
      name: "nhtuvd",
      address: "165 - Hoang Van Thai - Da Nang",
      password: "12345678",
      )
end