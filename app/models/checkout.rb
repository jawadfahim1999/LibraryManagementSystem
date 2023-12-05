class Checkout < ApplicationRecord
  belongs_to :book
  belongs_to :patron

  validates :checked_out_at, presence: true
  validates :due_date, presence: true

  validate :due_date_after_checked_out_at

  def due_date_after_checked_out_at
    return unless checked_out_at.present? && due_date.present?

    errors.add(:due_date, 'must be after the check-out date') if due_date <= checked_out_at
  end
end
