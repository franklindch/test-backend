class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy

  validates :name, presence: true

  default_scope { order(created_at: :asc) }
end
