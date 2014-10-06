require "rails_helper"
 
RSpec.describe TicketsController, :type => :controller do
   
    before(:each) do
      controller.stub(:authenticate_user!).and_return(true)
    @ticket = Ticket.create!(department_id: 1, priority_id: 1, subject: "issue", message: "issue description")
    @tickets = Ticket.all
    # user = FactoryGirl.build(:user)
    # user.password = "123456"
    # user.save
    # post :login, {:email => user.email, :password => "123456"}
    end


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

   describe "GET #show" do
    it "renders the show template" do
       get :show, id: @ticket
       expect(response).to render_template("show")
    end
   end

   describe "GET #new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
      expect(response).to have_http_status(200)
     end
  end

  # describe "POST #create" do
  #   it "it creates the new blog" do
  #    post :create
  #    expect(response).to render_template("show")
  #   end
  # end
end

