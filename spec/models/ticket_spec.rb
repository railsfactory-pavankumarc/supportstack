require 'rails_helper'

RSpec.describe Ticket, :type => :model do
	#test for validations 
  	it{ should validate_presence_of(:department).with_message("Please select any department") }
  	it{ should validate_presence_of(:priority).with_message("Please select priority") }
  	it{ should validate_presence_of(:subject).with_message("subject cannot be blank") }
  	it{ should validate_presence_of(:message).with_message("message cannot be blank") }
  	it{ should accept_nested_attributes_for :attachment }
  	
   	#test for associations
  	it { should have_one(:attachment) }
end

RSpec.describe Ticket, :type => :model do
    it "orders by latest create" do
    	ticket = Ticket.create!(department_id: 1, priority_id: 2, subject: "subject", message: "message")
     	expect(Ticket.last).to eq(ticket)
	end
end

RSpec.describe Ticket, :type => :model do
	it 'is invalid without a subject, department and priority' do
		ticket = Ticket.new
		ticket.should_not be_valid
	end

	it 'is invalid without a message, department and priority' do
	 	ticket = Ticket.new
	 	ticket.subject = "Tech support"
	 	ticket.save
	 	ticket.should_not be_valid
	end

	it 'is invalid without department' do
	 	ticket = Ticket.new
	 	ticket.subject = "tech support"
	 	ticket.message = "tech support description"
	 	ticket.priority_id = 2
	 	ticket.save
	 	ticket.should_not be_valid
	end

	it 'is invalid without priority' do
	 	ticket = Ticket.new
	 	ticket.subject = "tech support"
	 	ticket.message = "tech support description"
	 	ticket.department_id = 1
	 	ticket.save
	 	ticket.should_not be_valid
	end

	it 'is valid with subject, message, department and priority' do
	 	ticket = Ticket.new
	 	ticket.subject = "tech support"
	 	ticket.message = "tech support description"
	 	ticket.department_id = 1
	 	ticket.priority_id = 2
	 	ticket.save
	 	ticket.should be_valid
	end
end