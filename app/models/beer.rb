class Beer < ActiveRecord::Base
  paginates_per 10

  acts_as_paranoid

  belongs_to :category

  validates :name, presence: true
  validates :category_id, presence: true
  validates :manufacturer, presence: true
  validates :country, presence: true
  validates :price, presence: true, format: { :with => /\A\d+(?:\.\d{0,2})?\z/ }, numericality: {:greater_than => 0}
  validates :description, presence: true

  scope :beers_of_category, ->(category_id) { where(category_id: category_id) }
  scope :archived, ->{ where( archive_status: 1) }
  scope :unarchived, ->{ where( archive_status: 0) }
end
