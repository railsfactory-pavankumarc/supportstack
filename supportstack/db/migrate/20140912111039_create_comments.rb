class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user_id, index: true
      t.references :ticket_id, index: true
      t.string :comment

      t.timestamps
    end
  end
end
