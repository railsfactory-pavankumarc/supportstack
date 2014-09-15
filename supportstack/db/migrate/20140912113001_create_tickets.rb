class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :subject
      t.string :message
      t.boolean :active, :default => true
      t.references :department_id, index: true
      t.references :priority_id, index: true
      t.references :status_id, index: true

      t.timestamps
    end
  end
end
