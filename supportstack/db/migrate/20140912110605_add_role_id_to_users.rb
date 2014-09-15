class AddRoleIdToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :role, index: true, :default => 'client' 
    add_reference :users, :department, index: true
  end
end
