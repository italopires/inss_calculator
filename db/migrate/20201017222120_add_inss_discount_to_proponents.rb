class AddInssDiscountToProponents < ActiveRecord::Migration[5.2]
  def change
    add_column :proponents, :inss_discount, :float
  end
end
