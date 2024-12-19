class Booking < ApplicationRecord
  belongs_to :room

  validates :title, :booked_by, presence: true
end
