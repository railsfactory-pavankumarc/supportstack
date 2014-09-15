class AddMobileNoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :mobile_no, :string
    add_column :users, :fax, :string
    add_column :users, :active, :boolean, :default => true
  end
end
