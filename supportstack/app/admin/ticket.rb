ActiveAdmin.register Ticket do



  permit_params :subject, :message, :active, :priority_id, :department_id, :status_id

index do
    selectable_column
    column :subject
    column :message
    column :active
    column :status
    actions
  end

form do |f|
    f.inputs "Ticket Details" do
      f.input :department, prompt: "Select department"
      f.input :priority, prompt: "Select priority"
      f.input :status, as: :hidden, value: Status.find_by(name: "pending").try(:id) 
      f.input :subject
      f.input :message
    end
    f.actions
end

end
