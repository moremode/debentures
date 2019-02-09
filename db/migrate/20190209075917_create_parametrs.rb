class CreateParameters < ActiveRecord::Migration[5.2]
  def change
    create_table :parameters do |t|
      t.integer :loan_amount
      t.integer :year_percent
      t.datetime :date_start
      t.datetime :date_end
      t.integer :delay_payment
      t.integer :delay_percent

      t.timestamps
    end
  end
end
