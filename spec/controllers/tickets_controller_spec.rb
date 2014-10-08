require "rails_helper"

RSpec.describe TicketsController, :type => :controller do
  include Devise::TestHelpers
   
  let(:user) { FactoryGirl.create(:user, :client) }
  let(:current_user) {sign_in user}
  let(:ticket) { FactoryGirl.create(:ticket, :ticket1) }
   
  before(:each) do
    controller.stub(:authenticate_user!).and_return(true)
    @tickets = Ticket.all
  end

  #index
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      assigns(:tickets).should eq(@tickets)
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end 
  end 
  
  #new
  describe "GET #new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
      expect(response).to have_http_status(200)
    end
  end

  #show
  describe "GET #show" do
    it "renders the show template" do
        ticket
       get :show, id: ticket
       expect(response).to render_template("show")
    end
  end

  
  #create
  describe "POST #create" do
    it "should create a ticket" do
      current_user
      ticket.id = user.id 
      post :create, ticket: FactoryGirl.attributes_for(:ticket,:ticket1)
      expect(response).to have_http_status(302)
    end
  end

  
  # #update 
  # describe "PUT #update" do
  #   it "should update the ticket" do
  #     current_user
  #     @last_ticket =  FactoryGirl.create(:ticket,:ticket2)
  #     patch :update, :id => @last_ticket, ticket: {:subject => "subject"}
  #     @last_ticket.reload
  #     expect(@last_ticket.subject).to eq("subject")
  #     end
  #   end

  #Routing
  describe "routing" do
    it "routes to #index" do
      get :index, use_route: "tickets#index"
    end

    it "routes to #new" do
      get :new, use_route: "tickets#new"
    end

    it "routes to #create" do
      expect(:post => tickets_path ).to route_to(:controller => "tickets", :action => "create")
    end

    it "routes to #update" do
      patch :update, :id => 1, use_route: "tickets#update"
    end
  end
end
