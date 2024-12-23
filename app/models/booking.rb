class Booking < ApplicationRecord
  belongs_to :room
  belongs_to :user

  validates :title, presence: true
end
