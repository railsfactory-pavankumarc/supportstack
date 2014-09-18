class StaffController < ApplicationController
	
	def index
	end

	def destroy
    @staff.destroy
    respond_to do |format|
      format.html { redirect_to new_user_session_path, notice: 'staff was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end
