class Auth < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  self.table_name = "customers"

  has_one :api_key, :foreign_key => "customer_id"

  validates :email,
    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }, 
    presence: true, uniqueness: true

  def self.login(params)
    customer = Auth.find_by(email: params[:email])
    fail ResourceNotFound unless customer.present?
    fail Unauthorized unless customer.valid_password?(params[:password].to_s)
    customer.api_key.present? ? customer.api_key.set_expiration : ApiKey.create!(customer_id: customer.id)
    customer.reload
  end

  def self.logout(customer)
    customer.api_key.destroy!
    customer
  end
  
end
