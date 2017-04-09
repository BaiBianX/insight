class AddBirthdayColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :birthday, :timestamp
  end
end
