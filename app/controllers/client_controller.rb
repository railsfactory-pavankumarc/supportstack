class ClientController < ApplicationController
before_action :authenticate_user! 
	def index
    
    @tickets = Ticket.where(user_id: current_user.id)
   
  end


  def new
    @clients = User.new
  end

  def create
    @clients = User.new(ticket_params)

      respond_to do |format|
      if @clients.save
          format.html { redirect_to @clients }
          
        
        end
      end
  end

  def update
      respond_to do |format|
        if @clients.update(ticket_params)
          format.html { redirect_to @clients
          
        end
      end
    end


end
