class RenameTypeOfRooms < ActiveRecord::Migration[7.0]
  def change
    add_column :rooms, :room_type, :string
    remove_column :rooms, :type
  end
end
