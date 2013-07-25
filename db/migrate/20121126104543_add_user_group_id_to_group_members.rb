class AddUserGroupIdToGroupMembers < ActiveRecord::Migration
  def change
    add_column :group_members, :user_group_id, :integer
  end
end
