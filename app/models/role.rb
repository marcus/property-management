class Role < ActiveRecord::Base
  has_many :users, :through => :memberships
  has_many :memberships
  
  serialize :permissions
  validates_presence_of :name
  validates_uniqueness_of :name
  
  def permissions
    read_attribute(:permissions) || []
  end

  def permissions=(perms)
    perms = perms.collect {|p| p.to_sym unless p.blank? }.compact if perms
    write_attribute(:permissions, perms)
  end

  # Return true if role is allowed to do the specified action
  # - a parameter-like Hash (eg. :controller => 'property', :action => 'edit')
  # - a permission Symbol (eg. :edit_property)
  def allowed_to?(action)
    if action.is_a? Hash
      authorized = allowed_actions.include? "#{action[:controller]}/#{action[:action]}"
    else
      authorized = allowed_permissions.include? action
    end
    logger.debug "Authorizing: Granted: #{authorized}"
    authorized
  end


private
  def allowed_permissions
    @allowed_permissions ||= permissions# + AccessControl.permissions.collect {|p| p.name}
  end

  def allowed_actions
    @actions_allowed ||= allowed_permissions.inject([]) { 
      |actions, permission| actions += AccessControl.allowed_actions(permission) 
    }.flatten
  end
end