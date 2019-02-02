class ResidentailChanges < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :residential_address
    add_column :passports, :residential_address, :string
  end
end
