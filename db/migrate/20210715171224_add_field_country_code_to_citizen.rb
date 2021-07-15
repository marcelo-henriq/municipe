class AddFieldCountryCodeToCitizen < ActiveRecord::Migration[5.2]
  def change
    add_column :citizens, :country_code, :integer
  end
end
