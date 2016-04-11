class Category < ActiveRecord::Base
  paginates_per 10

  acts_as_paranoid

  has_many :beers, dependent: :restrict_with_error


  validates :name, presence: true
  validates :description, presence: true
end
