class AddContextToRoles < ActiveRecord::Migration
  def self.up
    add_column "roles", "context", :string
  end

  def self.down
    remove_column "roles", "context"
  end
end
