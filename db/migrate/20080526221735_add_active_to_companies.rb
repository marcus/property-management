class AddActiveToCompanies < ActiveRecord::Migration
  def self.up
    add_column "companies", "active", :boolean
  end

  def self.down
    remove_column "companies", "active"
  end
end