class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.string :vin
      t.string :year
      t.string :make
      t.string :model
      t.belongs_to :owner, null: false, foreign_key: true

      t.timestamps
    end
  end
end
