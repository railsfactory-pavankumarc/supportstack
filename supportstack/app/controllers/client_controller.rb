class ClientController < ApplicationController
  before_action :authenticate_user!
	def index
		
	end

	def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to new_user_session_path, notice: 'client was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end
