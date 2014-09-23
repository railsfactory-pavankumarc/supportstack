ActiveAdmin.register News do

	permit_params :title, :description, :department_id

	index do
    	selectable_column
    	column :title
    	column :description
    	column :department
        actions
  	end

end