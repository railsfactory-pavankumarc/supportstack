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
    validates :department, :presence => { :message => "Please select any department" }
    validates :priority, :presence => { :message => "Please select priority" }
    validates :subject, :presence => { :message => "subject cannot be blank" }
    validates :message, :presence => { :message => "message cannot be blank" }

	#scopes
	scope :active, ->{ where(active: true) }
  scope :inactive, ->{ where(active: false) }
	scope :pending, ->{ joins(:status).where('statuses.name =?', 'pending') }
	scope :waiting, ->{ joins(:status).where('statuses.name =?', 'awaiting for users reply') }
	scope :closed, ->{ joins(:status).where('statuses.name =?', 'closed') }

    def set_status
        @status = Status.find_by(name: "pending")
        self.update_attributes(status_id: @status.id)
    end

    def update_status(tid,ticket)
    	if (ticket.status.name == "pending") || (ticket.status.name == "awaiting for users reply")
      		@sid = Status.find_by_name("closed")
      		ticket.update_attributes(:status_id => @sid.id)
    	elsif (ticket.status.name == "closed")
      		@sid = Status.find_by_name("pending")
      		ticket.update_attributes(:status_id => @sid.id)
    	end
    end
end
