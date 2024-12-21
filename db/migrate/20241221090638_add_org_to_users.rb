class AddOrgToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :organization, :text
  end
end
