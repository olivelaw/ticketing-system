class UserGroup < ActiveRecord::Base
  attr_accessible :name
  has_many :group_members
end
