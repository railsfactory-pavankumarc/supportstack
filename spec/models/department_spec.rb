require 'rails_helper'

RSpec.describe Department, :type => :model do

	#test for validations 
  	it{ expect validate_presence_of(:name).with_message("name cannot be blank") }
  	it{ expect validate_presence_of(:description).with_message("description cannot be blank")}

   	#test for associations
  	it { expect have_many(:users) }
  	it { expect have_many(:tickets)}


end


RSpec.describe Department, :type => :model do
   	it "orders by latest create" do
     	lastdept = Department.create!(name: "Tech support", description: "tech support")
     	expect(Department.last).to eq(lastdept)
   	end
end

RSpec.describe Department, :type => :model do
	it 'is invalid without a name' do
		department = Department.new
		department.should_not be_valid
	end

	it 'is invalid without a description' do
	 	department = Department.new
	 	department.name = "Tech support"
	 	department.save
	 	department.should_not be_valid
	end

	it 'is valid with name and description' do
	 	department = Department.new
	 	department.name = "tech support"
	 	department.description = "tech support description"
	 	department.save
	 	department.should be_valid
	end
end
