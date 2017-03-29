class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :mobile
      t.string :password_digest
      t.string :nickname

      t.timestamps
    end

    add_index :users, :mobile, unique: true
  end
end
