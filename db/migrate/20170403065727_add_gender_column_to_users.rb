class AddGenderColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :gender, :integer, default: 0, index: true
  end
end
