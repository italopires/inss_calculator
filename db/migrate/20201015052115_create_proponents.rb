class CreateProponents < ActiveRecord::Migration[5.2]
  def change
    create_table :proponents do |t|
      t.string :name
      t.string :cpf
      t.date :birthdate
      t.string :public_place
      t.string :address_number
      t.string :neighborhood
      t.string :cep
      t.string :personal_phone
      t.string :reference_phone
      t.float :salary

      t.timestamps
    end
  end
end
