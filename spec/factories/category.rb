
require 'ffaker'

FactoryGirl.define do

  factory :category do
    name {FFaker::Name.name}
    description {FFaker::Lorem.paragraphs}
  end

end