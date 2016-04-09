ActiveRecord::Base.transaction do
  User.destroy_all
  puts "Create admin ....."
  User.create!(
      email: "admin@gmail.com",
      name: "nhutvd",
      address: "165 - Hoang Van Thai - Da Nang",
      password: "12345678",
      )
end