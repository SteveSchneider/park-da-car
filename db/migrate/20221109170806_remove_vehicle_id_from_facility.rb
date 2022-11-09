class RemoveVehicleIdFromFacility < ActiveRecord::Migration[7.0]
  def change
    remove_column :facilities, :vehicle_id, :integer
  end
end
