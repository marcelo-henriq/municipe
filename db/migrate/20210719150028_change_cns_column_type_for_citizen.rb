class ChangeCnsColumnTypeForCitizen < ActiveRecord::Migration[5.2]
  def change
    change_column(:citizens, :cns, :string)
  end
end
