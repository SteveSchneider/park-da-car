class CreateFacilities < ActiveRecord::Migration[7.0]
  def change
    create_table :facilities do |t|
      t.string :name
      t.string :address
      t.integer :parking_spot
      t.references :vehicle, null: false, foreign_key: true

      t.timestamps
    end
  end
end
