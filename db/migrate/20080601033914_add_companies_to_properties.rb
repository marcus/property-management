class AddCompaniesToProperties < ActiveRecord::Migration
  def self.up
    add_column "properties", "company_id", :integer
  end

  def self.down
    remove_column "properties", "company_id"
  end
end
