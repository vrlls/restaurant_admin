class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :name, null: false
      t.string :last_name
      t.text :address, null: false
      t.string :phone, null: false
      t.string :email
      t.text :notes

      t.timestamps
    end
  end
end
