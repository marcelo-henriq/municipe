class CreateCitizens < ActiveRecord::Migration[5.2]
  def change
    create_table :citizens do |t|
      t.string :name
      t.integer :cpf
      t.integer :cns
      t.date :birth_date
      t.integer :phonenumber
      t.string :photo
      t.string :status

      t.timestamps
    end
  end
end
