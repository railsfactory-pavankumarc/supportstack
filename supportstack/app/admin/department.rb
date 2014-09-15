ActiveAdmin.register Department do

  permit_params :name, :description, :active
  
end
