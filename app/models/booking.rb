class Booking < ApplicationRecord
  belongs_to :room
  belongs_to :user
  
  validate :no_time_clash
  validate :end_time_after_start_time

  validates :title, presence: true

private

  def no_time_clash
    overlapping_bookings = Booking.where("room_id = ? AND ((start_time < ? AND end_time > ?))", room_id, end_time, start_time)
                          .where.not(id: id)
    if overlapping_bookings.exists?
      errors.add(:base, "There is already a booking during this time.")
    end
  end

  def end_time_after_start_time
    if end_time.present? && start_time.present? && end_time <= start_time
      errors.add(:end_time, "End time must be after the start time.")
    end
  end
end
