class AddVehicleToActivities < ActiveRecord::Migration[7.0]
  def change
    add_reference :activities, :vehicle, null: false, foreign_key: true
  end
end
