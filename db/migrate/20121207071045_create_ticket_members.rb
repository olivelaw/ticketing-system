class CreateTicketMembers < ActiveRecord::Migration
  def change
    create_table :ticket_members do |t|
      t.integer :ticket_id
      t.integer :user_id

      t.timestamps
    end
  end
end
