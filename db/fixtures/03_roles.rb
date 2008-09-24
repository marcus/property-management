# Later: TODO add a property count limit to companies and give company principles add property
# rights limited to the total.

# Roles for properties
Role.seed(:name) do |s|
  s.name = "property_owner"
  s.permissions = [:edit_property,
                   :manage_attachments,
                   :manage_photos,
                   :manage_events,
                   :view_attachments,
                   :view_events]
                   #Manage testmonials
  s.context = "Property"
end

Role.seed(:name) do |s|
  s.name = "property_manager"
  s.permissions = [:edit_property,
                   :manage_attachments,
                   :manage_photos,
                   :manage_events,
                   :view_attachments,
                   :view_events]
  s.context = "Property"
end

Role.seed(:name) do |s|
  s.name = "property_visitor"
  s.permissions = [:view_attachments]
                  # Leave testimonial
                  # View maps
  s.context = "Property"
end

# Roles for business
# Company principal can do everything within the context of the company.
Role.seed(:name) do |s|
  s.name = "company_principal"
  s.permissions = [ :view_admin, :manage_properties, :manage_company ]
  s.context = "Company"
end