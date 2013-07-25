class DropColumnUsergroups < ActiveRecord::Migration
  def change
    drop_table :user_groups
    rename_column :group_members, :user_group_id, :project_id
  end

end
