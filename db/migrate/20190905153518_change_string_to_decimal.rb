class ChangeStringToDecimal < ActiveRecord::Migration[6.0]
  def change
    change_column :products, :price, "numeric USING CAST(price as numeric)"
    change_column :products, :price, :decimal, precision: 12, scale: 2
  end
end
