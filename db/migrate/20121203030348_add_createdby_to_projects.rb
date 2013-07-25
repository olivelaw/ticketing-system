class AddCreatedbyToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :createdby, :integer
  end
end
