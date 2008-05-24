class AddRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.string :name
      t.text :permissions
      t.timestamps
    end
    
    create_table :members do |t|
      t.integer :user_id
      t.integer :property_id
      t.integer :role_id
    end
  end

  def self.down
    drop_table :roles
  end
end
