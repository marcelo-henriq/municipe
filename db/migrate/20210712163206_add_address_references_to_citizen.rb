class AddAddressReferencesToCitizen < ActiveRecord::Migration[5.2]
  def change
    add_reference :citizens, :address, index: true
  end
end
