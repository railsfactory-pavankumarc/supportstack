class Department < ActiveRecord::Base
	
	#associations
	has_many :users
	has_many :tickets

	#validations
	validates :name, :description, presence: true

	#scopes
	scope :active, ->{ where(active: true) }
    scope :inactive, ->{ where(active: false) }


end
