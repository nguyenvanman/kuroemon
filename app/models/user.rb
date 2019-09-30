class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PHONE_NUMBER_REGEX = /\A(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}\z/i
  before_save :down_case_email
  has_secure_password

  validates :name,
    presence: true, 
    length: { maximum: 50 }
    
  validates :email, 
    presence: true,
    length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX, message: 'Invalid email format' },
    uniqueness: { case_sensitive: false }

  validates :phone,
    format: { with: VALID_PHONE_NUMBER_REGEX, message: 'Invalid phone number format' }
    
  validates :password,
    presence: true,
    confirmation: true,
    length: { within: 6..50 }, 
    on: :create

  validates :password,
    confirmation: true,
    length: { within: 6..50 }, 
    allow_blank: true,
    on: :update
  
  def down_case_email
    self.email = email.downcase
  end
end
