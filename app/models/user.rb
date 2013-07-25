class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :full_name, :job_title
  # attr_accessible :title, :body

  JOBS =['Project Manager', 'Developer', 'Sales User', 'Admin/HR/Accounting', 'Superadmin']

  has_many :group_members
  has_many :projects
  has_many :tickets, :foreign_key => :createdby
  belongs_to :group

end
