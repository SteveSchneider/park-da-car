class RemoveActivityIdFromUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :activity_id, :integer
  end
end
