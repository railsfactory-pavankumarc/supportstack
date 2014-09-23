class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.string :description
      t.references :department, index: true

      t.timestamps
    end
  end
end
