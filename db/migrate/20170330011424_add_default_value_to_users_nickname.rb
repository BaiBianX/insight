# coding: utf-8
class AddDefaultValueToUsersNickname < ActiveRecord::Migration[5.0]
  def self.up
    change_column :users, :nickname, :string, default: '普通用户'
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration, "Can't remove default values"
  end
end
