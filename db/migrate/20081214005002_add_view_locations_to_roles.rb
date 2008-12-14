class AddViewLocationsToRoles < ActiveRecord::Migration
  def self.up
    r1 = Role.find_by_name("property_owner")
    r2 = Role.find_by_name("property_manager")
    r3 = Role.find_by_name("property_visitor")
    [r1, r2, r3].each{|r|
      r.permissions = r.permissions << :view_location
      r.save
    }
  end

  def self.down
    r1 = Role.find_by_name("property_owner")
    r2 = Role.find_by_name("property_manager")
    r3 = Role.find_by_name("property_visitor")
    [r1, r2, r3].each{|r|
      r.permissions = r.permissions.reject{ |p| p == :view_location }
      r.save
    }
  end
end
