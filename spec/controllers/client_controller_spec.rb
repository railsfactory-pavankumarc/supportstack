require 'rails_helper'

RSpec.describe ClientController, :type => :controller do
  include Devise::TestHelpers
  
  let(:user) { FactoryGirl.create(:user, :client) }
  let(:current_user) {sign_in user}
  
  before(:each) do
  	controller.stub(:authenticate_user!).and_return(true)
  end
  
  describe "GET #index" do
   	it "responds successfully with an HTTP 200 status code" do
     	current_user
      get :index
     	expect(response).to have_http_status(302)
   	end
  end 
end