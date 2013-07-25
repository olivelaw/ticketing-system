class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :name
      t.integer :assigned_to
      t.string :descripton
      t.boolean :status

      t.timestamps
    end
  end
end
