ActiveAdmin.register Department do

	permit_params :name, :description, :active

	scope :active
	scope :inactive

    controller do 
  		def destroy
			@dept = Department.find_by(id: params[:id])
    		@dept.update(active: false)
    		redirect_to "/admin/departments"
    	end
    end

    filter :name
    
    index do
    	selectable_column
    	column :name
    	column :description
    	actions
    end

    show do
    	attributes_table do
    	  	row :name
      		row :description
    	end
  	end
end
