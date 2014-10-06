require 'rails_helper'

RSpec.describe Priority, :type => :model do
  	it { expect have_many(:tickets) }
end

RSpec.describe Priority, :type => :model do
	it "orders by latest create" do
     	priority = Priority.create!(name: "high")
    	expect(Priority.last).to eq(priority)
   	end
end


# describe Priority do
  
# 	before(:each) do
# 		@priority = Priority.new()
# 	end
	
# 	# Accessible attributes
# 	it "should make priority attr_accessible fields" do
#     Priority.should_receive(:attr_accessible).with(:id, :name)
#     load "#{Rails.root}/app/models/priority.rb"
#   end
# end