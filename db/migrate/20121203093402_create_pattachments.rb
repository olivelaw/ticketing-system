class CreatePattachments < ActiveRecord::Migration
  def change
    create_table :pattachments do |t|
      t.integer :project_id

      t.timestamps
    end
  end
end
