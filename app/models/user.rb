class User < ApplicationRecord
  has_secure_password

  has_many :categories, dependent: :destroy
  has_many :todos,      dependent: :destroy

  validates :first_name, :last_name, :username, :email, presence: true
  validates :username, :email, uniqueness: true

  # Ensure passwords are at least 8 characters long when set
  validates :password, length: { minimum: 8 }, allow_nil: true
end
