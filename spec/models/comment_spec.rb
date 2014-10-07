require 'rails_helper'

RSpec.describe Comment, :type => :model do
	it { expect have_one(:attachment) }

	it{ should accept_nested_attributes_for :attachment }
end

RSpec.describe Comment, :type => :model do
   	it "orders by latest create" do
    	comment = Comment.create!(user_id: 1, ticket_id: 1, comment: "comment")
     	expect(Comment.last).to eq(comment)
   	end
end
 