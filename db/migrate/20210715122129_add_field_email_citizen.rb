class AddFieldEmailCitizen < ActiveRecord::Migration[5.2]
  def change
    add_column :citizens, :email, :string
  end
end
