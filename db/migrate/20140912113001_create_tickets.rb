class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :subject
      t.string :message
      t.boolean :active, :default => true
      t.references :department, index: true
      t.references :priority, index: true
      t.references :status, index: true,:default => 'pending'
      t.references :user, index: true
      t.timestamps
    end
  end
end
