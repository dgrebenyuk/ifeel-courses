class AddDevicesCountToUsers < ActiveRecord::Migration[6.1]
  def up
    add_column :users, :devices_count, :integer
    Rake::Task['users:reset_devices_count'].invoke
  end

  def down
    remove_column :users, :devices_count
  end
end
