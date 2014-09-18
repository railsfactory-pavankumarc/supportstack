ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    
    strong section "Recent tickets" do
      table_for Ticket.order("created_at desc").limit(5) do
        column :subject
        column :message
        column :department
        column :priority
        column :status
      end
    end

    strong section "Recent users" do
      table_for User.order("created_at desc").limit(5) do
        column :first_name
        column :email
        column :mobile_no
        column :role
      end
    end
  end 
end
