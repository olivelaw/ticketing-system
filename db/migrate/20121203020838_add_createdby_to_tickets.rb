class AddCreatedbyToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :createdby, :integer
  end
end
