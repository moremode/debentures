class CreatePassports < ActiveRecord::Migration[5.2]
  def change
    create_table :passports do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.string :serial
      t.string :number
      t.datetime :given
      t.string :address
      t.boolean :gender

      t.timestamps
    end
  end
end
