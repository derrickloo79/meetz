class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.string :name
      t.string :description
      t.datetime :start_time
      t.datetime :end_time
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
