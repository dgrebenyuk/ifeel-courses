class CreateDevices < ActiveRecord::Migration[6.1]
  def change
    create_table :devices do |t|
      t.string :address
      t.string :vendor

      t.timestamps
    end
  end
end
