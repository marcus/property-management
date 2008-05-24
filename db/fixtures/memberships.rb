Membership.seed(:user_id, :context_id, :context_type) do |s|
  s.user_id = User.find_by_login("marcus").id
  s.context_id = Property.find_by_name("Jackson Hole").id
  s.context_type = Property.find_by_name("Jackson Hole").class.to_s
  s.role_id = Role.find_by_name("property_owner").id
end