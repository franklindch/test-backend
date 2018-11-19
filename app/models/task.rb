class Task < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :project

  enum status: [:pending, :completed]

  validates :description, :deadline,presence: true

  def due?
    deadline >= Date.today
  end
end
