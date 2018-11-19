class Task < ApplicationRecord
  has_many :users
  belongs_to :project
end
