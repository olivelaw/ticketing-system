class CreateTComments < ActiveRecord::Migration
  def change
    create_table :t_comments do |t|
      t.integer :ticket_id
      t.integer :user_id
      t.string :comment

      t.timestamps
    end
  end
end
