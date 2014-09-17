class User < ActiveRecord::Base
  
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
    attr_accessor :client
    # before_create :set_role
    
    #accociations
	has_many :attachments, as: :attachable
	has_many :tickets
    belongs_to :department
    belongs_to :role

    #validations
    validates :first_name, :mobile_no, presence: true
    validates_presence_of :company_name, :if => Proc.new {|user| user.client}
    #validates_presence_of :department_id, :if => Proc.new {|user| !user.client}

    #scopes																																																																																																																																																																																												
    scope :active, ->{ where(active: true) }
    scope :inactive, ->{ where(active: false) }
    scope :client, ->{ joins(:role).where('roles.name =?', 'client') }
    scope :staff, ->{ joins(:role).where('roles.name =?', 'staff') }
    scope :active_staff, ->{ active.staff }
    scope :active_client, ->{ active.client }
    scope :inactive_staff, ->{ inactive.staff }
    scope :inactive_client, ->{ inactive.client }
   

    # def set_role
    #   self.role = Role.find_by(id: role_id) || Role.find_by(name: "client")
    # end

end
