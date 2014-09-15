class AddRoleIdToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :role_id, index: true
    add_reference :users, :department_id, index: true
  end
end
