class ChangeProfileFields < ActiveRecord::Migration[6.1]
  def change
    rename_column :profiles, :pnone_number, :phone_number
    add_column :profiles, :address, :string
    add_column :users, :status, :integer, default: 0
  end
end
