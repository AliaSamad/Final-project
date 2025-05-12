class Todo < ApplicationRecord
  belongs_to :user
  belongs_to :category          # <-- this line
  validates :title, presence: true
end
