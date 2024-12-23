class MakeBookingsAJoinTable < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :user_id, :integer
    remove_column :bookings, :booked_by, :string
    Booking.delete_all
  end
end
