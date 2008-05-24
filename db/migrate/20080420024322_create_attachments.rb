class CreateAttachments < ActiveRecord::Migration
  def self.up
    create_table :attachments do |t|
      t.string :attached_file_name
      t.string :attached_content_type
      t.string :attached_file_size
      t.string :name
      t.text :description
      t.integer :property_id

      t.timestamps
    end
  end

  def self.down
    drop_table :attachments
  end
end
