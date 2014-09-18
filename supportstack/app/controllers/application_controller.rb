class ApplicationController < ActionController::Base
	
	before_action :configure_permitted_parameters, if: :devise_controller?
	protect_from_forgery with: :exception
    
	
	protected
	def configure_permitted_parameters
   		devise_parameter_sanitizer.for(:sign_up){|u|u.permit(:email, :password, :password_confirmation, :first_name, :last_name, :company_name, :mobile_no, :fax)}
   		devise_parameter_sanitizer.for(:account_update) << :first_name << :last_name << :mobile_no << :company_name << :fax << :email
  	end

  	def current_user_role
  		@user = current_user.role
  	end

  	def after_sign_in_path_for(user)
  		if (user_signed_in?) and (current_user_role.name == "staff")
  			 staff_index_path
    	else
      	 client_index_path
    	end 
    end
end
