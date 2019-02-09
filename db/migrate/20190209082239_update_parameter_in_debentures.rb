class UpdateParameterInDebentures < ActiveRecord::Migration[5.2]
  def change
    remove_reference :debentures, :parameters_id
    add_reference :debentures, :parameter
  end
end
