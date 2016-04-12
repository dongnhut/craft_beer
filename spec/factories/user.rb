
require 'ffaker'

FactoryGirl.define do

  factory :user do
    email 'admin@gmail.com'
    name {FFaker::Name.name}
    address {FFaker::Address.street_address + FFaker::Address.city}
    password '12345678'
  end

end