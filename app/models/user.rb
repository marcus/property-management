require 'digest/sha1'
class User < ActiveRecord::Base
  has_many :memberships, :include => [ :context, :role ]
  has_many :properties, :through => :memberships
  has_many :companies, :through => :memberships
  has_many :events, :foreign_key => :owner_id, :dependent => :destroy
  has_many_polymorphs :contexts, :from => [:properties, :companies], :through => :memberships
  
  # Virtual attribute for the unencrypted password
  attr_accessor :password

  validates_presence_of     :login, :email, :color
  validates_presence_of     :password,                   :if => :password_required?
  validates_presence_of     :password_confirmation,      :if => :password_required?
  validates_length_of       :password, :within => 4..40, :if => :password_required?
  validates_confirmation_of :password,                   :if => :password_required?
  validates_length_of       :login,    :within => 3..40
  validates_length_of       :email,    :within => 3..100
  validates_uniqueness_of   :login, :email, :case_sensitive => false
  before_save :encrypt_password
  
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  attr_accessible :login, :email, :password, :password_confirmation
  
  def self.anonymous_user
    User.find_by_login('anon')
  end
  
  def anonymous?
    login == 'anon'
  end
  
  def name
    "#{firstname} #{lastname}"
  end

  # ROLES
  def role_for_context(context)
    return nil unless context
    membership = memberships.detect {|m| m.context_id == context.id  && m.context_type == context.class.to_s }
    
    if membership
      membership.role
    else
      false
    end
  end
  
  # Return true if the user is a member of property/biz
  def member_of?(context)
    context.users.include? self
  end
  
  # Return true if the user is allowed to do the specified action takes:
  # - a parameter-like Hash (eg. :controller => 'properties', :action => 'edit')
  # - a permission Symbol (eg. :edit_property)
  def allowed_to?(action, context)
    if context
      return true if admin?
      # No action allowed on inactive contexts
      return false unless context.active?
      role = role_for_context(context)
      return false unless role
      
      logger.debug { "Authorizing #{role.id} can #{action.to_yaml} for #{context.name} a #{context.class} \n" }
      role.allowed_to?(action)
      
    #elsif options[:global]
    #  # authorize if user has at least one role that has this permission
    #  roles = memberships.collect {|m| m.role}.uniq
    #  roles.detect {|r| r.allowed_to?(action)}
    else
      false
    end
  end
  
  
  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  def self.authenticate(login, password)
    u = find_by_login(login) # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end

  # Encrypts some data with the salt.
  def self.encrypt(password, salt)
    Digest::SHA1.hexdigest("--#{salt}--#{password}--")
  end

  # Encrypts the password with the user salt
  def encrypt(password)
    self.class.encrypt(password, salt)
  end

  def authenticated?(password)
    crypted_password == encrypt(password)
  end

  def remember_token?
    remember_token_expires_at && Time.now.utc < remember_token_expires_at 
  end

  # These create and unset the fields required for remembering users between browser closes
  def remember_me
    remember_me_for 2.weeks
  end

  def remember_me_for(time)
    remember_me_until time.from_now.utc
  end

  def remember_me_until(time)
    self.remember_token_expires_at = time
    self.remember_token            = encrypt("#{email}--#{remember_token_expires_at}")
    save(false)
  end

  def forget_me
    self.remember_token_expires_at = nil
    self.remember_token            = nil
    save(false)
  end

  # Returns true if the user has just been activated.
  def recently_activated?
    @activated
  end

  protected
    # before filter 
    def encrypt_password
      return if password.blank?
      self.salt = Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{login}--") if new_record?
      self.crypted_password = encrypt(password)
    end
      
    def password_required?
      crypted_password.blank? || !password.blank?
    end
    
    
end
