class Ticket < ActiveRecord::Base
  attr_accessible :assigned_to, :descripton, :name, :status, :project_id, :createdby, :ticket_members_attributes, :attachment
  belongs_to :project
  has_many :t_comments
  has_many :ticket_members
  has_attached_file :attachment

  accepts_nested_attributes_for :ticket_members
end
