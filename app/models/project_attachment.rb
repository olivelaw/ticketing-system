class ProjectAttachment < ActiveRecord::Base

  has_attached_file :attachment

  belongs_to :project
end
