class UpdateParameterInDebentures1 < ActiveRecord::Migration[5.2]
  def change
    remove_reference :debentures, :parameters
  end
end
