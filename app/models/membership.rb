class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :role
  belongs_to :context, :polymorphic => true
    
  validates_presence_of :role, :user, :context
  
  after_save :add_company_managers_to_properties
  
  # Each time a user becomes a company principal they get the role property owner for each
  # Property in the company
  def add_company_managers_to_properties
    if context.class == Company && role.name == "company_principal"
      property_owner_role_id =  Role.find_by_name('property_owner').id
      context.properties.each do |property|
        #Create the membership
        Membership.find_or_create_by_user_id_and_context_id_and_role_id_and_context_type(
          self.user.id,
          property.id,
          property_owner_role_id,
          property.class.to_s
        )
      end
    end
  end
end



#Membership.seed(:user_id, :context_id, :role_id, :context_type) do |s|
#  u = User.find_by_login('carl')
#  c = Company.first
#  s.user_id = u.id
#  s.context_id = c.id
#  s.role_id = Role.find_by_name('company_principal').id
#  s.context_type = c.class.to_s
#end