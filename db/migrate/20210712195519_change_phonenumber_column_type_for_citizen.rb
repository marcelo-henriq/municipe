class ChangePhonenumberColumnTypeForCitizen < ActiveRecord::Migration[5.2]
  def change
    change_column(:citizens, :phonenumber, :string)
  end
end
