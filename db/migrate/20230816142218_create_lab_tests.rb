class CreateLabTests < ActiveRecord::Migration[7.0]
  def change
    create_table :lab_tests do |t|
      t.string :category
      t.string :unit_of_measurement
      t.decimal :min_ref_value
      t.decimal :max_ref_value

      t.timestamps
    end
  end
end
