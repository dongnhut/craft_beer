require "rails_helper"

RSpec.describe User, :type => :model do


  describe "valid Factory" do
    it "has a valid factory" do
      expect(FactoryGirl.build(:user)).to be_valid
    end
  end
  
  describe 'Validation' do
    it 'email should present' do
      should validate_presence_of(:email)
    end

    it 'name should present' do
      should validate_presence_of(:name)
    end

    it 'address should present' do
      should validate_presence_of(:address)
    end
  end

  describe "Relationship" do
  end

end