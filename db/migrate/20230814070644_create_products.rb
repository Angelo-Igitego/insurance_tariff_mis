class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.boolean :available
      t.string :productable_type
      t.bigint :productable_id
      t.string :unit_of_measurement
      t.decimal :cost_price
      t.decimal :selling_price
      t.decimal :reimbursable_amount

      t.timestamps
    end
    add_index :products, [:productable_id, :productable_type], unique: true
  end
end
