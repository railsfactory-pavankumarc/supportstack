class News < ActiveRecord::Base
  belongs_to :department
  
  #validations
   
    validates :title, :presence => { :message => "title cannot be blank" }
    validates :description, :presence => { :message => "description cannot be blank" }


end
