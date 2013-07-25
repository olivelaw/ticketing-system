class AddAttachmentAttachmentToProjects < ActiveRecord::Migration
  def self.up
    change_table :projects do |t|
      t.has_attached_file :attachment
    end
  end

  def self.down
    drop_attached_file :projects, :attachment
  end
end
