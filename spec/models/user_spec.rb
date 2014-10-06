require 'rails_helper'

RSpec.describe User, :type => :model do
  	#test for validations 
  it { expect validate_presence_of(:first_name).with_message("cannot be blank") }
  #it{ expect validate_presence_of(:company_name).with_message("company name cannot be empty") }
  it{ expect validate_presence_of(:mobile_no).with_message("cannot be blank") }
  it{ expect validate_presence_of(:email)}
   	
   	#test for associations
  it { expect have_many(:tickets) }
  it { expect have_one(:attachment)}
  #it { expect belongs_to(:department) }
  #it { expect belongs_to(:role) }
  
end
