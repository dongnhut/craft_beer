require "rails_helper"

RSpec.describe Beer, :type => :model do

  describe "valid Factory" do
    it "has a valid factory" do
      expect(FactoryGirl.build(:beer)).to be_valid
    end
  end

  describe 'Validation' do

    it 'name should present' do
      should validate_presence_of(:name)
    end

    it 'manufacturer should present' do
      should validate_presence_of(:manufacturer)
    end

    it 'country should present' do
      should validate_presence_of(:country)
    end

    it 'price should present' do
      should validate_presence_of(:price)
    end

    it 'description should present' do
      should validate_presence_of(:description)
    end
  end

  describe "Relationship" do
    it 'should belong_to category' do
      should belong_to(:category)
    end
  end
  
end