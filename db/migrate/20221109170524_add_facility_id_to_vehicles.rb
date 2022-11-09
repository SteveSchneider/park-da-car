class AddFacilityIdToVehicles < ActiveRecord::Migration[7.0]
  def change
    add_column :vehicles, :facility_id, :integer
  end
end
