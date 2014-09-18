class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, index: true
      t.references :ticket, index: true
      t.string :comment

      t.timestamps
    end
  end
end
