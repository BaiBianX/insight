class AddColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :description, :string
    add_column :users, :educations, :string, array: true, default: []
    add_column :users, :locations, :string, array: true, default: []
    add_column :users, :experience, :string, array: true, default: []
  end
end
