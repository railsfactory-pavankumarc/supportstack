ActiveAdmin.register Ticket do

  permit_params :subject, :message, :active, :priority_id, :department_id, :status_id, attachment_attributes: [:attachment]

  scope :active
  scope :inactive
  scope :pending
  scope :waiting
  scope :closed


  index do
    selectable_column
    column :subject
    column :message
    column :status
    column :priority
    column :department
    actions
  end

  filter :department

  form do |f|
    f.inputs "Ticket Details" do
      f.input :department, prompt: "Select department"
      f.input :priority, prompt: "Select priority"
      f.input :status_id, as: :hidden, value: Status.find_by(name: "pending").try(:id) 
      f.input :subject
      f.input :message
  	end
    f.inputs "Attachment", for: [:attachment, (f.object.attachment.present? ? f.object.attachment : f.object.build_attachment)] do |s|
		s.input :attachment, :as => :file, :hint => s.template.image_tag(s.object.attachment), :label => "attachment"
	 end
    f.actions
  end

  show do
    attributes_table do
      row :subject
      row :message
      row :department
      row :priority
      row :status
    end
  end

  
  controller do 
    def destroy
    @ticket = Ticket.find_by(id: params[:id])
      @ticket.update(active: false)
      @ticket.update(status_id: 4)
      redirect_to "/admin/tickets"
    end
  end
end
