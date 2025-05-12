class User < ApplicationRecord
  has_secure_password

  has_many :categories, dependent: :destroy
  has_many :todos,      dependent: :destroy

  validates :first_name, :last_name, :username, :email, presence: true
  validates :username, :email, uniqueness: true
  validates :password, length: { minimum: 8 }, if: -> { password.present? }

  # hook to seed default categories
  after_create :create_default_categories

  private

  def create_default_categories
    %w(Academic Work Personal).each do |cat_name|
      categories.create!(name: cat_name)
    end
  end
end

