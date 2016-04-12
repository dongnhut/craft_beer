class Beer < ActiveRecord::Base
  paginates_per 10

  acts_as_paranoid

  belongs_to :category

  validates :name, presence: true
  validates :manufacturer, presence: true
  validates :country, presence: true
  validates :price, presence: true
  validates :description, presence: true

  scope :beers_of_category, ->(category_id) { where(category_id: category_id) }
end
