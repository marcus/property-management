Company.seed(:name, false) do |s|
  s.name = "Northwest Properties"
  s.description = "Northwest Properties is an exclusive vacation rental property provider in Hawaii, Jackson Hole, Wyoming and BC, Canada."
  s.email = "carl@ckjohnson.com"
  s.logo = File.new("#{RAILS_ROOT}/simages/nwproperties_logo.jpg")
  s.active = true
end