class RenameFieldOfBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :title, :string
    Booking.all.each do |booking|
      booking.title = booking.name
      booking.save
    end
    remove_column :bookings, :name
  end
end
