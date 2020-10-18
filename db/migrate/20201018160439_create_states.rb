class CreateStates < ActiveRecord::Migration[5.2]
  def change
    create_table :states do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_reference :proponents, :state, foreign_key: true
  end
end
