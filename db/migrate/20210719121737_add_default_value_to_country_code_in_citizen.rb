class AddDefaultValueToCountryCodeInCitizen < ActiveRecord::Migration[5.2]
  def change
    change_column :citizens, :country_code, :integer, default: 55
  end
end
