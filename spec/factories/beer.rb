
require 'ffaker'

FactoryGirl.define do |f|


  factory :beer do |f|
    
    f.association  :category
    f.name {FFaker::Name.name}
    f.manufacturer {FFaker::Company.name}
    f.country {FFaker::Address.country}
    f.price {rand(11...76)}
    f.description {FFaker::Lorem.paragraphs}
    f.archive_status {rand(0...1)}

  end

end