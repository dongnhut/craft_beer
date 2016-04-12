
require 'ffaker'

FactoryGirl.define do

  factory :beer do
    name {FFaker::Name.name}
    category_id {rand(Category.count)}
    manufacturer {FFaker::Company.name}
    country {FFaker::Address.country}
    price {rand(11.2...76.9)}
    description {FFaker::Lorem.paragraphs}
  end

end