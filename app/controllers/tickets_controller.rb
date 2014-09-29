class TicketsController < ApplicationController
  before_action :authenticate_user!
	before_action :set_ticket, only: [:show, :edit, :update, :destroy]

	def index
		@tickets = Ticket.all
    @comment = Comment.all
	end


	def new
		@tickets = Ticket.new
    @dept = Department.all
    @priority = Priority.all
	end

	def create
		@tickets = Ticket.new(ticket_params)
    @tickets.user_id = current_user.id      
    	respond_to do |format|
    	if @tickets.save
        	format.html { redirect_to @tickets, notice: 'Ticket was successfully created.' }
        	
      	else
        	format.html { render :new }
      	end
    	end
	end
  def show
    @comments = Comment.where(:ticket_id => params[:id])

  end


	def update

    @tid = params[:id]
    @ticket = Ticket.find_by_id(@tid)
    if (@ticket.status.name == "pending") || (@ticket.status.name == "awaiting for users reply")
      @sid = Status.find_by_name("closed")
      @ticket.update_attributes(:status_id => @sid.id)
    elsif (@ticket.status.name == "closed")
      @sid = Status.find_by_name("pending")
      @ticket.update_attributes(:status_id => @sid.id)
    end
    respond_to do |format|
      format.html { redirect_to @tickets, notice: 'Ticket was successfully updated.' }   
    end
  end

  	private
  
    def set_ticket
      	@tickets = Ticket.find(params[:id])
    end

    def ticket_params
    	params.require(:ticket).permit(:subject, :message, :active, :department_id, :priority_id, :status_id, attachment_attributes: [:attachment]  )
    end
end
