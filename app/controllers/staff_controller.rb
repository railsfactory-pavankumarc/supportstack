class StaffController < ApplicationController
	before_action :authenticate_user!

	def index
    status = params[:status_name] || "assigned_tickets"
    @t = []
    @ticket = Ticket.where("department_id =?", current_user.department_id)
    @ticket.each do |s|
      if status == s.status.name
        @t << s
      elsif status == "assigned_tickets"
        @t << s
      end
    end
  end
end
