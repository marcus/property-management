Property.seed(:name, false) do |s|
  s.name = "Jackson Hole"
  s.company = Company.first
  s.description = "Default text for Jackson Hole"
  s.location = "Jackson Hole, Wyoming"
  s.active = 1
end

PropertyPhoto.seed(:name) do |pp|
  pp.name = 'Jackson Hole'
  pp.photo = File.new("#{RAILS_ROOT}/simages/jackson02.jpg")
  pp.featured = 1
  pp.property_id = Property.find_by_name("Jackson Hole").id
end

###############
Property.seed(:name) do |s|
  s.name = "Whistler"
  s.company = Company.first
  s.description = "Default text for Whistler"
  s.location = "Whistler, BC"
  s.active = 1
end

PropertyPhoto.seed(:name) do |pp|
  pp.name = 'Whistler'
  pp.photo = File.new("#{RAILS_ROOT}/simages/whistler02.jpg")
  pp.featured = 1
  pp.property_id = Property.find_by_name("Whistler").id
end


################
Property.seed(:name) do |s|
  s.name = "Hawaii"
  s.company = Company.first
  s.description = "Default text for Hawaii"
  s.location = "Hawaii"
  s.active = 1
end

PropertyPhoto.seed(:name) do |pp|
  pp.name = 'Hawaii'
  pp.photo = File.new("#{RAILS_ROOT}/simages/hawaii02.jpg")
  pp.featured = 1
  pp.property_id = Property.find_by_name("Hawaii").id
end
