class ChangeOwnerNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null :vehicles, :owner_id, true
  end
end
