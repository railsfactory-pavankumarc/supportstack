class Department < ActiveRecord::Base
	has_many :users
	has_many :tickets

	   scope :active, ->{ where(active: true) }
       scope :inactive, ->{ where(active: false) }
end
