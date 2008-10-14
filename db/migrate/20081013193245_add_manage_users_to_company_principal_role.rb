class AddManageUsersToCompanyPrincipalRole < ActiveRecord::Migration
  def self.up
    r = Role.find_by_name("company_principal")
    r.permissions << :manage_users
    r.save
  end

  def self.down
    r = Role.find_by_name("company_principal")
    r.permissions.reject!{|p| p == :manage_users}
    r.save
  end
end
