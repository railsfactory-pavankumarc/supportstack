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

