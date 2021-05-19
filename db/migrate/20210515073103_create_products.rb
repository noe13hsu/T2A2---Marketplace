class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.decimal :price, null: false, default: 0.0
      t.string :condition, null: false
      t.string :console, null: false

      t.timestamps
    end
  end
end
