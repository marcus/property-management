class AddPropertyPhotos < ActiveRecord::Migration
  def self.up
    create_table :property_photos, :force => true do |t|
      t.string :photo_file_name
      t.string :photo_content_type
      t.string :photo_file_size
      t.string :name
      t.text :description
      t.boolean :featured
      t.integer :property_id
      t.integer :position
      t.timestamps
    end
  end

  def self.down
    drop_table :property_photos
  end
end
