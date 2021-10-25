class AddDeviceStatusToDevices < ActiveRecord::Migration[6.1]
  def change
    add_column :devices, :device_status, :integer
  end
end
