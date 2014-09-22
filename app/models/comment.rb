class Comment < ActiveRecord::Base
  has_many :attachments, as: :attachable
  belongs_to :commentable, :polymorphic => true

  

end
