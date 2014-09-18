class AddFirstNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :company_name, :string
    add_column :users, :mobile_no, :string
    add_column :users, :fax, :string
    add_column :users, :active, :boolean, :default => true
  end
end
