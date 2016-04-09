class Beer < ActiveRecord::Base
  paginates_per 10

  belongs_to :category

  validates :name, presence: true
  validates :manufacturer, presence: true
  validates :country, presence: true
  validates :price, presence: true
  validates :description, presence: true
end
