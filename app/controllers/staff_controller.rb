class StaffController < ApplicationController
	
	def index
    @status = params[:status_name]
    @t = []
    @ticket = Ticket.all
    @ticket.each do |s|
      if s.department_id == current_user.department_id
        if @status == s.status.name
          @t << s
        elsif @status == "assigned_tickets"
          @t << s
        end
      end
    end
	end

	def destroy
    @staff.destroy
    respond_to do |format|
      format.html { redirect_to new_user_session_path, notice: 'staff was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end
