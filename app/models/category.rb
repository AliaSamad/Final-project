class Category < ApplicationRecord
  # each Category belongs to one User
  belongs_to :user

  # and has many ToDos—destroying a Category deletes its ToDos
  has_many :todos, dependent: :destroy

  # validations
  validates :name, presence: true
end


