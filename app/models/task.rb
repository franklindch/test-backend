class Task < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :project

  enum status: [:pending, :completed]
  enum priority: [:Priority_1, :Priority_2, :Priority_3]

  validates :description, :deadline, presence: true

  def due?
    deadline <= Date.today
  end
end
