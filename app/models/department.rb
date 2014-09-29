class Department < ActiveRecord::Base
	
	#associations
	has_many :users
	has_many :tickets
	

	#validations
	validates :name, :presence => { :message => "name cannot be blank" }
	validates :description, :presence => { :message => "description cannot be blank" }

	#scopes
	scope :active, ->{ where(active: true) }
    scope :inactive, ->{ where(active: false) }


end
