# Scoping for roles is currently wrong. Some permissions should be scoped to the property,
# Others should be scoped to the site... or is that ADMIN vs. Property X?
# Admin should still be scoped within a specific company (though in this case there is only one company)
# So.... for now hmm. Property owners cannot add properties, only Admins

# Roles for properties
Role.seed(:name) do |s|
  s.name = "property_owner"
  s.permissions = [:add_properties,
                   :remove_properties,
                   :edit_properties,
                   :deactivate_properties,
                   :view_attachments,
                   :add_attachments,
                   :edit_attachments,
                   :remove_attachments,
                   :add_events,
                   :edit_events,
                   :remove_events,
                   :view_event_details]
                   #Manage testmonials
  s.context = "Property"
end

Role.seed(:name) do |s|
  s.name = "property_manager"
  s.permissions = [:edit_properties,
                   :add_attachments,
                   :edit_attachments,
                   :view_attachments,
                   :remove_attachments,
                   :add_events,
                   :edit_events,
                   :remove_events,
                   :view_event_details]
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
  s.permissions = [ :view_admin, :manage_company ]
  s.context = "Company"
end