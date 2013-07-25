class AddAttachmentAttachmentToPComments < ActiveRecord::Migration
  def self.up
    change_table :p_comments do |t|
      t.has_attached_file :attachment
    end
  end

  def self.down
    drop_attached_file :p_comments, :attachment
  end
end
