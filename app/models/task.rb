class Task < ApplicationRecord
  has_many :comments
  belongs_to :project

  validates :description, presence: true
end
