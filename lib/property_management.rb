require 'access_control'

# TODO This will need to change when the app is multiple user
def current_company
  Company.find(:first)
end

# index show new edit create udpate destroy
default_admin = [ :index, :show, :new, :edit, :create, :update, :destroy ]

AccessControl.map do |map|
  # Company scope
  map.permission :manage_properties,    { "admin/properties"        => [ :index, :show, :edit, :update         ] }
  map.permission :admin_properties,     { "admin/properties"        => [ :new, :create, :destroy, :deactivate  ] }
  map.permission :manage_users,         { "admin/users"             => default_admin                             ,
                                          "admin/memberships"       => default_admin                             }
  map.permission :manage_company,       { "admin/companies"         => [ :show, :edit, :update                 ] ,
                                          :pages                    => default_admin                             ,
                                          :account                  => [ :edit                                 ] }
  map.permission :view_admin,           { "admin/properties"        => [ :index                                ] }
                                                                                                               
  # Property scope - admin                                                                                     
  map.permission :edit_property,        { "admin/properties"        => [ :show, :update, :edit                 ] }
  map.permission :manage_attachments,   { "admin/attachments"       => default_admin                             }
  map.permission :manage_photos,        { "admin/property_photos"   => default_admin                             }
  map.permission :manage_events,        { "admin/events"            => (default_admin << :update_calendar )      }
                                                                                                               
  # Property scope - user                                                                                      
  map.permission :view_attachments,     { :attachments              => [ :show                                 ] }
  map.permission :view_events,          { :events                   => [ :show                                 ] }
end
