class Comment < ActiveRecord::Base
  	
  	has_one :attachment, as: :attachable
  	belongs_to :commentable, :polymorphic => true
	accepts_nested_attributes_for :attachment, allow_destroy: true

	def update_status(comment)
 		@id = comment.ticket_id
    	@tc = Ticket.find_by_id(@id)
    	if @tc.status.name != "closed"
        	@sid = Status.find_by_name("awaiting for users reply")
        	@tc.update_attributes(:status_id => @sid.id)
    	end
	end
end
