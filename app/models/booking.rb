class Booking < ApplicationRecord
  belongs_to :room
  belongs_to :user
  
  validate :no_time_clash

  validates :title, presence: true

private

  def no_time_clash
    overlapping_bookings = Booking.where("room_id = ? AND ((start_time < ? AND end_time > ?))", room_id, end_time, start_time)
                          .where.not(id: id)
    if overlapping_bookings.exists?
      errors.add(:base, "There is already a booking during this time.")
    end
  end
end
