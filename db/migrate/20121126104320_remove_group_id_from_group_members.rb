class RemoveGroupIdFromGroupMembers < ActiveRecord::Migration
  def up
    remove_column :group_members, :group_id
      end

  def down
    add_column :group_members, :group_id, :integer
  end
end
