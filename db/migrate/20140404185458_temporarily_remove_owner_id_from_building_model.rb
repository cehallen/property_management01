class TemporarilyRemoveOwnerIdFromBuildingModel < ActiveRecord::Migration
  def up
    remove_column :buildings, :owner_id, :integer
  end

  def down
    add_column :buildings, :owner_id, :integer, null: false
  end
end
