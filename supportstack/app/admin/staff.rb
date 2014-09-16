ActiveAdmin.register User, :as => "staff" do


  permit_params :first_name, :last_name, :department_id, :role_id, :company_name, :mobile_no, :fax, :email, :password, :password_confirmation

  scope :active_staff
  scope :inactive_staff

  index do
    selectable_column
    column :first_name
    column :department
    column :mobile_no
    column :email
    actions
  end

  form do |f|
    f.inputs "Staff Details" do
      f.input :first_name
      f.input :last_name
      f.input :department, prompt: "Select department"
      f.input :role_id, as: :hidden, value: Role.find_by(name: "staff").try(:id) 
      f.input :mobile_no
      f.input :fax
      f.input :email
      f.input :password if f.object.new_record?
      f.input :password_confirmation if f.object.new_record?
    end
    f.actions
  end

  show do
    attributes_table do
      row :first_name
      row :email
      row :mobile_no
      row :department
    end
  end
  
  controller do
    def scoped_collection                                                                                                                                                                                                                                                
      @staffs=User.staff
    end
  end
 
  controller do 
    def destroy
      @staff = User.find_by(id: params[:id])
      @staff.update(active: false)
      redirect_to "/admin/staffs"
    end
  end
end
