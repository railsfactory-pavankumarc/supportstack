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
    #validates_presence_of :department_id, :if => Proc.new {|user| !user.client}, :message => "Please select any department" 
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

    def self.find_for_oauth(auth, signed_in_resource = nil)

        identity = Identity.find_for_oauth(auth)
        user = signed_in_resource ? signed_in_resource : identity.user
        if user.nil?
            email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email)
            email = auth.info.email if email_is_verified
            user = User.where(:email => email).first if email

            if user.nil?
                user = User.new(
                first_name: auth.extra.raw_info.name,
                #username: auth.info.nickname || auth.uid,
                email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
                password: Devise.friendly_token[0,20]
                )
                user.skip_confirmation!
                user.save!
            end
        end
        if identity.user != user
            identity.user = user
            identity.save!
        end
        user
    end

    def email_verified?
        self.email && self.email !~ TEMP_EMAIL_REGEX
    end
end
