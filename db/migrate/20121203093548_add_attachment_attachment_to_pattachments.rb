class AddAttachmentAttachmentToPattachments < ActiveRecord::Migration
  def self.up
    change_table :pattachments do |t|
      t.has_attached_file :attachment
    end
  end

  def self.down
    drop_attached_file :pattachments, :attachment
  end
end
