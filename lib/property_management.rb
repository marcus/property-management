require 'access_control'

# This will need to change when the app is multiple user
def current_company
  Company.find(:first)
end

# index show new edit create udpate destroy
AccessControl.map do |map|
  # Company scope
  map.permission :add_properties,     { :properties  => [ :new, :create         ] }
  map.permission :delete_properties,  { :properties  => [ :destroy              ] }
  map.permission :deactivate_property,{ :properties  => [ :deactivate           ] }
  map.permission :edit_company,       { :company     => [ :show, :edit, :update ] ,
                                        :account     => [ :edit                 ] }
  
  # Property scope
  map.permission :edit_property,      { :properties  => [ :update, :edit        ] }
  map.permission :add_attachments,    { :attachments => [ :new, :create         ] }
  map.permission :delete_attachments, { :attachments => [ :destroy              ] }
  map.permission :edit_attachments,   { :attachments => [ :update, :edit        ] }
  map.permission :view_attachments,   { :attachments => [ :index, :show         ] }
  map.permission :add_events,         { :events      => [ :new, :create         ] }
  map.permission :remove_events,      { :events      => [ :destroy              ] }
  map.permission :edit_events,        { :events      => [ :update, :edit        ] }
  map.permission :view_event_details, { :events      => [ :show                 ] }
end