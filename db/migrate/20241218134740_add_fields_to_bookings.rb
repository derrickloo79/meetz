class AddFieldsToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :booked_by, :string
  end
end
