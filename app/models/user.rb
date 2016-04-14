class User < ActiveRecord::Base
  paginates_per 10

  acts_as_paranoid

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
  #:registerable

  validates :name, presence: true
  validates :address, presence: true
  validates :email, presence: true, uniqueness: true

end
