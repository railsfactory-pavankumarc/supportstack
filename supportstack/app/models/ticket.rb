class Ticket < ActiveRecord::Base
	
  belongs_to :departments
  belongs_to :priorities
  belongs_to :statuses
  belongs_to :users
end
