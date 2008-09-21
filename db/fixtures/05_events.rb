Event.seed(:name, :property_id) do |s|
  s.name = "Bob Jones"
  s.description = "Bob Jones occupancy"
  s.property_id = Property.find_by_name("Jackson Hole").id
  s.starts_at = Date.today
  s.ends_at = Date.today + 7.days
  s.event_type = "occupancy"
  s.owner_id = User.find_by_login('marcus').id
end

Event.seed(:name, :property_id) do |s|
  s.name = "Joe Smith"
  s.description = "Joe Smith occupancy"
  s.property_id = Property.find_by_name("Whistler").id
  s.starts_at = Date.today + 5.days
  s.ends_at = Date.today + 12.days
  s.event_type = "occupancy"
  s.owner_id = User.find_by_login('marcus').id
end

Event.seed(:name, :property_id) do |s|
  s.name = "Tommy Lee Jones"
  s.description = "Tommy Lee Jones occupancy"
  s.property_id = Property.find_by_name("Hawaii").id
  s.starts_at = Date.today + 10.days
  s.ends_at = Date.today + 17.days
  s.event_type = "occupancy"
  s.owner_id = User.find_by_login('marcus').id
end