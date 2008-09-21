Page.seed(:name) do |s|
  s.name = 'About Us'
  s.slug = 'about'
  s.content = "Northwest Properties is a property management company based out of Seattle."
  s.company_id = Company.first.id
end

Page.seed(:name) do |s|
  s.name = 'Contact Us'
  s.slug = 'contact'
  s.content = "You can contact us at ... "
  s.company_id = Company.first.id
end