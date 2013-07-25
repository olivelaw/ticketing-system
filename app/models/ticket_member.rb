class TicketMember < ActiveRecord::Base
  attr_accessible :ticket_id, :user_id
  belongs_to :ticket
end
