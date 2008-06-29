Property.seed(:name) do |s|
  s.name = "Jackson Hole"
  s.company = Company.first.id
end

Property.seed(:name) do |s|
  s.name = "Whistler"
  s.company = Company.first.id
end

Property.seed(:name) do |s|
  s.name = "Hawaii"
  s.company = Company.first.id
end