class Task < ApplicationRecord
  has_many :comments
  belongs_to :project

  enum status: [:pending, :completed]

  validates :description, presence: true
end
