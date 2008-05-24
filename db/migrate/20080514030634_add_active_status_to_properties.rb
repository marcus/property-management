class AddActiveStatusToProperties < ActiveRecord::Migration
  def self.up
    add_column :properties, :active, :boolean, :default => true
  end

  def self.down
    remove_column :properties, :active
  end
end
