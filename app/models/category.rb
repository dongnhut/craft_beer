class Category < ActiveRecord::Base
  paginates_per 10

  acts_as_paranoid

  has_many :beers, dependent: :restrict_with_error

  has_many :unarchived_beers, -> { where archive_status: 0 }, class_name: 'Beer'

  validates :name, presence: true
  validates :description, presence: true
end
