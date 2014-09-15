class Ticket < ActiveRecord::Base
has_many :attachments, as: :attachable
  belongs_to :department
  belongs_to :priority
  belongs_to :status
  belongs_to :user
end
