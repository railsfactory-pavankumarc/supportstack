class User < ActiveRecord::Base
    TEMP_EMAIL_PREFIX = 'change@me'
    TEMP_EMAIL_REGEX = /\Achange@me/
  
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable
    attr_accessor :client
   
    
    #accociations
    has_one :attachment, as: :attachable
    has_many :comment, :as => :commentable
	has_many :tickets
    belongs_to :department
    belongs_to :role

    accepts_nested_attributes_for :attachment, allow_destroy: true
    
    #validations
    validates :first_name, :presence => { :message => "cannot be blank" }
    validates :mobile_no, :presence => { :message => "cannot be blank" }
    validates_presence_of :company_name, :if => Proc.new {|user| user.client}, :message => "company name cannot be empty" 
    validates_format_of :email, :without => TEMP_EMAIL_REGEX, on: :update

    #scopes																																																																																																																																																																																												
    scope :active, ->{ where(active: true) }
    scope :inactive, ->{ where(active: false) }
    scope :client, ->{ joins(:role).where('roles.name =?', 'client') }
    scope :staff, ->{ joins(:role).where('roles.name =?', 'staff') }
    scope :active_staff, ->{ active.staff }
    scope :active_client, ->{ active.client }
    scope :inactive_staff, ->{ inactive.staff }
    scope :inactive_client, ->{ inactive.client }
end