class Ticket < ActiveRecord::Base
	after_create :set_status
	
	#associations
	has_many :comment, :as => :commentable
	has_one :attachment, as: :attachable
	belongs_to :department
	belongs_to :priority
	belongs_to :status
	belongs_to :user

	accepts_nested_attributes_for :attachment, allow_destroy: true

	#validations
    validates :department, :priority, :subject, :message, presence: true


	#scopes
	scope :active, ->{ where(active: true) }
    scope :inactive, ->{ where(active: false) }
	scope :pending, ->{ joins(:status).where('statuses.name =?', 'pending') }
	scope :open, ->{ joins(:status).where('statuses.name =?', 'open') }
	scope :waiting, ->{ joins(:status).where('statuses.name =?', 'awaiting for users reply') }
	scope :closed, ->{ joins(:status).where('statuses.name =?', 'closed') }

    def set_status
        @status = Status.find_by(name: "pending")
        self.update_attributes(status_id: @status.id)
     end
end
