ActiveAdmin.register User, :as => "Staff" do


permit_params :list, :of, :attributes, :on, :model, :first_name, :last_name, :department_id, :role_id, :company_name, :mobile_no, :fax, :email, :password, :password_confirmation

index do
    selectable_column
    column :first_name
    column :department
    column :role
    column :company_name
    column :mobile_no
    column :email
    actions
  end



  form do |f|
    f.inputs "User Details" do
      f.input :first_name
      f.input :last_name
      f.input :department, prompt: "Select department"
      f.input :role, as: :hidden, value: Role.find_by(name: "Staff").try(:id) 
      f.input :mobile_no
      f.input :fax
      f.input :email
      f.input :password if f.object.new_record?
      f.input :password_confirmation if f.object.new_record?
    end
    f.actions
  end

end
