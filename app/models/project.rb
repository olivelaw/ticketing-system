class Project < ActiveRecord::Base
  attr_accessible :description, :name, :members, :createdby
  attr_accessible :pattachments_attributes
  has_many :p_comments
  has_many :tickets
  has_many :group_members
  has_many :pattachments, :dependent => :destroy

accepts_nested_attributes_for :pattachments
  
 
end
