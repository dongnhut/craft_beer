class Customer < ActiveRecord::Base
  paginates_per 10

  acts_as_paranoid

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :api_key

  validates :email, presence: true
  validates :email,
    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }, 
    presence: true, uniqueness: true

  def self.register(params)
    @customer = create!(permit_create_customer(params))
    @customer
  end

  private
  
  def self.permit_create_customer(params)
      params.permit(:email, :password)
  end
  
end
