class ApplicationController < ActionController::Base
	
	before_action :configure_permitted_parameters, if: :devise_controller?
	protect_from_forgery with: :exception
  #before_action :admin_navication

  helper_method :current_user_role, :current_client, :current_staff, :client_ticket_count, :user_role
    
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
      @tickets = Ticket.where(user_id: current_user.id).all
      @tickets.count
    end

    def user_role
      @comments = Comment.all
      @comment.each do |c|
        @user_id = c.user_id    
        @user = User.find_by_id(@user_id)
        @role_name = @user.role.name 
      end
    end
	
	protected
	def configure_permitted_parameters
   		devise_parameter_sanitizer.for(:sign_up){|u|u.permit(:email, :password, :password_confirmation, :first_name, :last_name, :company_name, :mobile_no, :fax)}
   		devise_parameter_sanitizer.for(:account_update) << :first_name << :last_name << :mobile_no << :company_name << :fax << :email
  	end

  	

  	# def after_sign_in_path_for(user)
   #    if current_user_role.name == "staff"
  	# 		staff_index_path
   #    elsif current_user_role.name == "client"
   #      client_index_path
   #  	else
   #    	 root_path
   #  	end 
   #  end

    def admin_navication
      if admin_user_signed_in?
        redirect_to admin_root_path
      end
    end
end
