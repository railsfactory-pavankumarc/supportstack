ActiveAdmin.register News do

	permit_params :title, :description

	index do
    	selectable_column
    	column :title
    	column :description
    	
        actions
  	end
form do |f|
    f.inputs "News Details" do
      f.input :title
      f.input :description
    end
    f.actions
  end


show do
    attributes_table do
      	row :title
    	row :description
    end
end
end