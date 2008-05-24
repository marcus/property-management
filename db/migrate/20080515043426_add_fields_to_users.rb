class AddFieldsToUsers < ActiveRecord::Migration
  def self.up
    add_column "users", "firstname", :string
    add_column "users", "lastname", :string
    add_column "users", "admin", :boolean, :default => 0
    add_column "users", "status", :boolean, :default => 1
  end

  def self.down
  end
end
