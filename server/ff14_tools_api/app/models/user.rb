class User < ApplicationRecord
  has_many :static
  has_secure_password

  validates :email, :password_digest, presence: true
end
