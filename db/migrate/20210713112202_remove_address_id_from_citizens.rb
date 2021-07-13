class RemoveAddressIdFromCitizens < ActiveRecord::Migration[5.2]
  def change
    remove_column :citizens, :address_id
  end
end
