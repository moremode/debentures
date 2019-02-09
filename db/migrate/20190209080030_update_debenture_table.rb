class UpdateDebentureTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :debentures, :sanctions_payment
    remove_column :debentures, :count
    remove_column :debentures, :percent
    remove_column :debentures, :sanctions_percent
    remove_column :debentures, :last_date
    remove_column :debentures, :date
    add_reference :debentures, :parameters
  end
end
