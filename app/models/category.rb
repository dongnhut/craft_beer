class Category < ActiveRecord::Base
  paginates_per 10

  has_many :beers

  validates :name, presence: true
  validates :description, presence: true
end
