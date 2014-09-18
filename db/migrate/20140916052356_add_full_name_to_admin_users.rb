class AddFullNameToAdminUsers < ActiveRecord::Migration
  def change
    add_column :admin_users, :full_name, :string
    add_column :admin_users, :username, :string
    add_column :admin_users, :phone, :string
    add_column :admin_users, :mobile, :string
  end
end
