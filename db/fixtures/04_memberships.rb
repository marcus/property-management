#Membership.seed(:user_id, :context_id, :context_type) do |s|
#  s.user_id = User.find_by_login("marcus").id
#  s.context_id = Property.find_by_name("Jackson Hole").id
#  s.context_type = Property.find_by_name("Jackson Hole").class.to_s
#  s.role_id = Role.find_by_name("property_owner").id
#end

#Membership.seed(:user_id, :context_id, :context_type) do |s|
#  s.user_id = User.find_by_login("marcus").id
#  s.context_id = Company.find_by_name("Northwest Properties").id
#  s.context_type = Company.find_by_name("Northwest Properties").class.to_s
#  s.role_id = Role.find_by_name("company_principal").id
#end

Membership.seed(:user_id, :context_id, :role_id, :context_type) do |s|
  u = User.find_by_login('carl')
  c = Company.first
  s.user_id = u.id
  s.context_id = c.id
  s.role_id = Role.find_by_name('company_principal').id
  s.context_type = c.class.to_s
end

Membership.seed(:user_id, :context_id, :role_id, :context_type) do |s|
  u = User.find_by_login('andy')
  c = Company.first
  s.user_id = u.id
  s.context_id = c.id
  s.role_id = Role.find_by_name('company_principal').id
  s.context_type = c.class.to_s
end

Membership.seed(:user_id, :context_id, :role_id, :context_type) do |s|
  u = User.find_by_login('eric')
  c = Company.first
  s.user_id = u.id
  s.context_id = c.id
  s.role_id = Role.find_by_name('company_principal').id
  s.context_type = c.class.to_s
end

############ Manager 1
Membership.seed(:user_id, :context_id, :role_id, :context_type) do |s|
  u = User.find_by_login('manager1')
  c = Company.first
  s.user_id = u.id
  s.context_id = c.id
  s.role_id = Role.find_by_name('company_partner').id
  s.context_type = c.class.to_s
end


Membership.seed(:user_id, :context_id, :role_id, :context_type) do |s|
  u = User.find_by_login('manager1')
  c = Property.first
  s.user_id = u.id
  s.context_id = c.id
  s.role_id = Role.find_by_name('property_manager').id
  s.context_type = c.class.to_s
end