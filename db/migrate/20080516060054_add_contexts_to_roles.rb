class AddContextsToRoles < ActiveRecord::Migration
  def self.up
    rename_column "members", "property_id", "context_id"
    add_column "members", "context_type", :string
  end

  def self.down
    rename_column "members", "context_id", "property_id"
    remove_column "members", "context_type"
  end
end
