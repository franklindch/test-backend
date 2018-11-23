class Comment < ApplicationRecord
  belongs_to :task
  belongs_to :user

  mount_uploader :file, FileUploader

  validates :description, presence: true
end
