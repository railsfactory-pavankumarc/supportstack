require 'rails_helper'

RSpec.describe User, :type => :model do
  
  #test for validations 
  it { expect validate_presence_of(:first_name).with_message("cannot be blank") }
  it{ expect validate_presence_of(:mobile_no).with_message("cannot be blank") }
  it{ expect validate_presence_of(:email)}
  it{ should accept_nested_attributes_for :attachment } 	

  #test for associations
  it { expect have_many(:tickets) }
  it { expect have_one(:attachment)}
  it { should belong_to :department }
  it { should belong_to :role }

end
