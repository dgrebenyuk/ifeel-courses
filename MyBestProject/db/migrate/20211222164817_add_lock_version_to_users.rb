class AddLockVersionToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :lock_version, :integer, default: 0
  end
end
