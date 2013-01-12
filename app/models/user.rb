# Table: Users
#  id :integer
#  name :string
#  email :string
#  created_at :datetime
#  updated_at :datetime
class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password
  has_many :user_food_items

  # Before save callback
  before_save { |user| user.email = email.downcase }
  # Another before save callback to create remember token
  #before_save :create_remember_token

  validates :name, presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, 
  				uniqueness: {case_sensitive: false }

  validates :password, length: { minimum: 4 }
  validates :password_confirmation, presence: true

  private

  	def create_remember_token
  		#self.remember_token = SecureRandom.urlsafe_base64
  	end
end
