class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
        t.has_attached_file :attachment
        t.references :attachable, polymorphic: true
        t.timestamps
    end
  end
end
