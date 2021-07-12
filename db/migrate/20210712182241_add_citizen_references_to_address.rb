class AddCitizenReferencesToAddress < ActiveRecord::Migration[5.2]
  def change
    add_reference :addresses, :citizen, index: true
  end
end
