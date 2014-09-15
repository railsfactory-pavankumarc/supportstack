class Comment < ActiveRecord::Base
  belongs_to :user_id
  belongs_to :ticket_id
end
