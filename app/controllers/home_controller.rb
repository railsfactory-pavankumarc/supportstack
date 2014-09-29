class HomeController < ApplicationController
	

	before_action :navication, only: :index
	def index
	end

	private

	def navication
		if (user_signed_in?) and (current_user_role.name == "staff")
  			redirect_to staff_index_path
        elsif (user_signed_in?) and (current_user_role.name == "client")
       	 	redirect_to client_index_path
		end 
	end
end
