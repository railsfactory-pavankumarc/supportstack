class User < ActiveRecord::Base
  
    devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable
 	
    #accociations
	has_many :attachments, as: :attachable
	has_many :tickets
    belongs_to :department
    belongs_to :role

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
