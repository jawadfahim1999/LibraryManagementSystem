class Checkout < ApplicationRecord
  belongs_to :book
  belongs_to :patron

  scope :checked_out, -> { where(returned_at: nil) }
end
