class Task < ApplicationRecord
  belongs_to :user

  enum :status, { todo: 0, in_progress: 1, canceled: 2, done: 3 }
  enum :priority, { low: 0, medium: 1, high: 2, urgent: 3 }

  # Validations
  validates :title, presence: true
end
