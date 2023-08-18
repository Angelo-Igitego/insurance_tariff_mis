class CreateDrugs < ActiveRecord::Migration[7.0]
  def change
    create_table :drugs do |t|
      t.string :category
      t.string :form
      t.string :unit_of_measurement

      t.timestamps
    end
  end
end
