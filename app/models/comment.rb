class Comment < ActiveRecord::Base
  has_many :attachments, as: :attachable
  belongs_to :user_id
  belongs_to :ticket_id
end
