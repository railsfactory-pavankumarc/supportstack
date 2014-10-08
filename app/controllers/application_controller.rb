class ApplicationController < ActionController::Base

	
	before_action :configure_permitted_parameters, if: :devise_controller?
	protect_from_forgery with: :exception
  

  helper_method :current_user_role, :current_client, :current_staff, :client_ticket_count
    
    def current_user_role
      @user = current_user.role
    end

    def current_client
      current_user.try(:role).try(:name) == "client"
    end

    def current_staff
      current_user.try(:role).try(:name)  == "staff"
    end
   
    def client_ticket_count
      @tickets = Ticket.where(user_id: current_user.id)
      @tickets.count
    end

	
	protected
	def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up){|u|u.permit(:email, :password, :password_confirmation, :first_name, :last_name, :company_name, :mobile_no, :role_id, :fax, attachment_attributes: [:attachment])}
  	devise_parameter_sanitizer.for(:account_update) << :first_name << :last_name << :mobile_no << :company_name << :fax << :email
  end 
end