require 'rails_helper'



RSpec.describe Comment, :type => :model do
  it { expect have_one(:attachment) }
end

RSpec.describe Comment, :type => :model do
   it "orders by latest create" do
     comment = Comment.create!(user_id: 1, ticket_id: 1, comment: "comment")
     expect(Comment.last).to eq(comment)
   end
end

# describe Comment do
  
# 	before(:each) do
# 		@comment = Comment.new()
# 	end
	
# 	# Accessible attributes
# 	it "should make comment attr_accessible fields" do
#     Comment.should_receive(:attr_accessible).with(:id => 1, :user_id => 2, :ticket_id => 2, :comment => "string", :created_at => '2014-09-28 11:16:27.259226', :updated_at => '2014-09-28 11:16:27.259226')
#     load "#{Rails.root}/app/models/comment.rb"
#   end
# end
 