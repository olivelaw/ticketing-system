class PComment < ActiveRecord::Base
  attr_accessible :comment, :project_id, :user_id, :attachment
  has_attached_file :attachment
  belongs_to :project
end
