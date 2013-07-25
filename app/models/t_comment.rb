class TComment < ActiveRecord::Base
  attr_accessible :comment, :ticket_id, :user_id
  belongs_to :ticket
end
