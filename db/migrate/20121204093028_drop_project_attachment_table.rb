class DropProjectAttachmentTable < ActiveRecord::Migration
  def up
    drop_table :project_attachments
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
