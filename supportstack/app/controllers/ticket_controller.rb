class TicketController < ApplicationController
	before_action :set_ticket, only: [:show, :edit, :update, :destroy]

	def index
		@tickets = Ticket.all
	end


	def new
		@tickets = Ticket.new
	end

	def create
		@tickets = Ticket.new(ticket_params)

    	respond_to do |format|
    	if @tickets.save
        	format.html { redirect_to @tickets, notice: 'Ticket was successfully created.' }
        	format.json { render :show, status: :created, location: @tickets }
      	else
        	format.html { render :new }
        	format.json { render json: @tickets.errors, status: :unprocessable_entity }
      	end
    	end
	end

	def update
    	respond_to do |format|
      	if @tickets.update(ticket_params)
        	format.html { redirect_to @tickets, notice: 'Ticket was successfully updated.' }
        	format.json { render :show, status: :ok, location: @tickets }
      	else
        	format.html { render :edit }
        	format.json { render json: @tickets.errors, status: :unprocessable_entity }
      	end
    	end
  	end

  	private
  
    def set_ticket
      	@tickets = Ticket.find(params[:id])
    end

    def ticket_params
    	params.require(:tickets).permit(:subject, :message, :active)
    end


end
