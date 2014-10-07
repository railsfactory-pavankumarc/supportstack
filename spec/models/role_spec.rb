require 'rails_helper'

RSpec.describe Role, :type => :model do
  	it { should have_many(:users) }
end

RSpec.describe Role, :type => :model do
   	it "orders by latest create" do
     	role = Role.create!(name: "user")
     	expect(Role.last).to eq(role)
   	end
end
