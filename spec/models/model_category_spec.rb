require "rails_helper"

RSpec.describe Category, :type => :model do

  describe "valid Factory" do
    it "has a valid factory" do
      expect(FactoryGirl.build(:category)).to be_valid
    end
  end

  describe 'Validation' do

    it 'name should present' do
      should validate_presence_of(:name)
    end

    it 'description should present' do
      should validate_presence_of(:description)
    end
  end

  describe "Relationship" do
    it 'should has_many beers' do
      should have_many(:beers)
    end
  end
  
end