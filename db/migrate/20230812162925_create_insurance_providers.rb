class CreateInsuranceProviders < ActiveRecord::Migration[7.0]
  def change
    create_table :insurance_providers do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :city
      t.string :province_or_state
      t.string :country

      t.timestamps
    end
  end
end
