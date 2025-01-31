# app/models/task.rb
class Task < ApplicationRecord
  validates :title, presence: true
  validates :status, inclusion: { in: %w[pending in_progress completed] }

  # Optional validations
  validate :due_date_cannot_be_in_the_past

  private

  def due_date_cannot_be_in_the_past
    if due_date.present? && due_date < Date.today
      errors.add(:due_date, "can't be in the past")
    end
  end
end
