class ChangeCpfColumnTypeForCitizen < ActiveRecord::Migration[5.2]
  def change
    change_column(:citizens, :cpf, :string)
  end
end
