class CreateDebentures < ActiveRecord::Migration[5.2]
  def change
    create_table :debentures do |t|
      t.references :passport1
      t.references :passport2
      t.datetime :date
      t.integer :count
      t.datetime :last_date
      t.integer :percent
      t.integer :sanctions_percent
      t.integer :sanctions_payment

      t.timestamps
    end
  end
end
