Property.seed(:name, false) do |s|
  s.name = "Jackson Hole"
  s.company = Company.first
  s.description = "Default text for Jackson Hole"
  s.location = "Jackson Hole, Wyoming"
  s.active = 1
end

Property.seed(:name) do |s|
  s.name = "Whistler"
  s.company = Company.first
  s.description = "Default text for Whistler"
  s.location = "Whistler, BC"
  s.active = 1
end

Property.seed(:name) do |s|
  s.name = "Hawaii"
  s.company = Company.first
  s.description = "Default text for Hawaii"
  s.location = "Hawaii"
  s.active = 1
end