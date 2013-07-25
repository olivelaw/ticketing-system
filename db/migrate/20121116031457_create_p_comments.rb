class CreatePComments < ActiveRecord::Migration
  def change
    create_table :p_comments do |t|
      t.integer :project_id
      t.integer :user_id
      t.string :comment

      t.timestamps
    end
  end
end
