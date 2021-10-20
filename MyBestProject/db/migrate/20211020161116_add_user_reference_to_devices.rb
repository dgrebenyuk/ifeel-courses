class AddUserReferenceToDevices < ActiveRecord::Migration[6.1]
  def change
    add_reference :devices, :user
  end
end
