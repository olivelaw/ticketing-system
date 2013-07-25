class AddMembersToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :members, :integer
  end
end
