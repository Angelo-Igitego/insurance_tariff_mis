class CreateConsumables < ActiveRecord::Migration[7.0]
  def change
    create_table :consumables do |t|
      t.string :form
      t.string :unit_of_measurement

      t.timestamps
    end
  end
end
