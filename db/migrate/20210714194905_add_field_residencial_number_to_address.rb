class AddFieldResidencialNumberToAddress < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :residencial_number, :integer
  end
end
