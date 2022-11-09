class ChangeVehicleNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null :facilities, :vehicle_id, true
  end
end
