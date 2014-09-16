class User < ActiveRecord::Base
  
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
 	#before_create :check_user_type

    #accociations
	has_many :attachments, as: :attachable
	has_many :tickets
    belongs_to :department
    belongs_to :role

    #validations
    validates :first_name, :email, :mobile_no, :password_confirmation, presence: true

    
    validate :email, uniqueness: true
    #validates :company_name, presence: true,:if User.role_name == 'client'
    #validates :department_id, presence:true,:if => Proc.new{|g| g.role.name == "staff"}

    #scopes																																																																																																																																																																																												
    scope :active, ->{ where(active: true) }
    scope :inactive, ->{ where(active: false) }
    scope :client, ->{ joins(:role).where('roles.name =?', 'client') }
    scope :staff, ->{ joins(:role).where('roles.name =?', 'staff') }
    scope :active_staff, ->{ active.staff }
    scope :active_client, ->{ active.client }
    scope :inactive_staff, ->{ inactive.staff }
    scope :inactive_client, ->{ inactive.client }
   




   # private
   #  def check_user_type
   #      user_type = self.responds_to?(role_id) ? 1 : 2
   #      if user_type == 1
   #          validates_presence_of :department 
   #      else 
   #          validates_presence_of :company_name
   #      end
   #  end
end
