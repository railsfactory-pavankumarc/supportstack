require 'rails_helper'

RSpec.describe CommentsController, :type => :controller do
  include Devise::TestHelpers
  let(:user) { FactoryGirl.create(:user, :client) }
  let(:current_user) {sign_in user}
	
  before(:each) do
    controller.stub(:authenticate_user!).and_return(true)
  end

  describe "POST #create" do
    it "should create a comment" do
      current_user
      post :create, comment: FactoryGirl.attributes_for(:comment,:comment1)
      expect(response).to have_http_status(302)
    end
  end
end
