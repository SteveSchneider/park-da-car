class RemoveVehicleIdFromOwner < ActiveRecord::Migration[7.0]
  def change
    remove_column :owners, :vehicle_id, :integer
  end
end
