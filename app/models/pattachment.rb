class Pattachment < ActiveRecord::Base
  attr_accessible :project_id
  has_attached_file :attachment, :styles => {:medium => "300x300>", :thumb => "50x50>"}
  attr_accessible :attachment
  belongs_to :project
end
