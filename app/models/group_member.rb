class GroupMember < ActiveRecord::Base
  attr_accessible :user_group_id, :user_id
  belongs_to :project
  belongs_to :user
end
