ActiveAdmin.register User, :as => "client" do

  permit_params :first_name, :last_name, :department_id, :role_id, :company_name, :mobile_no, :fax, :email, :password, :password_confirmation, :client

  scope :active_client
  scope :inactive_client

  index do
    selectable_column
    column :first_name
    column :department
    column :company_name
    column :mobile_no
    column :email
    actions
  end


  form do |f|
    f.inputs "Client Details" do
      f.input :first_name
      f.input :last_name
      f.input :role_id, as: :hidden, value: Role.find_by(name: "client").try(:id)
      f.input :client, as: :hidden, value: true
      f.input :company_name
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
      row :company_name
      row :email
      row :mobile_no
    end
  end

  controller do
    def scoped_collection                                                                                                                                                                                                                                                
      @clients=User.client
    end
  end


  controller do 
    def destroy
      @client = User.find_by(id: params[:id])
      @client.update(active: false)
      redirect_to "/admin/clients"
    end
  end
end
