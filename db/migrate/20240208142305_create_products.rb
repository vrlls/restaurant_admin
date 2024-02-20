class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.float :unit_price, null: false, default: 0.0
      t.float :available_units, null: false, default: 0.0
      t.string :measure, null: false, default: 'units'
      t.text :description
      t.integer :product_type, null: false, default: 1

      t.timestamps
    end
  end
end
