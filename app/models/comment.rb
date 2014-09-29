class Comment < ActiveRecord::Base
  	
  	has_one :attachment, as: :attachable
  	belongs_to :commentable, :polymorphic => true

	accepts_nested_attributes_for :attachment, allow_destroy: true
end
