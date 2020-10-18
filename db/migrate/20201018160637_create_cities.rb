class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :name, null: false
      t.references :state, foreign_key: true, null: false

      t.timestamps
    end
    add_reference :proponents, :city, foreign_key: true
  end
end
