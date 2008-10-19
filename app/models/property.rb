class Property < ActiveRecord::Base
  named_scope :active, :conditions => {:active => true}
  named_scope :inactive, :conditions => {:active => false}

  belongs_to :company
  has_many :members, :through => :memberships, :source => :user
  has_many :attachments, :order => "position", :dependent => :destroy
  has_many :property_photos, :order => "position", :dependent => :destroy
  has_many :events, :dependent => :destroy
  
  validates_presence_of :company_id, :name
  
  after_create :give_company_principals_property_owner_role
  
  def featured_image
    self.property_photos.find(:first)#, :conditions => "attached_content_type")
    #TODO - check to see if the first attachment is an image. If not, move the first image up in the list
  end
  
  def deactivate!
    self.active = false
    self.save!
  end
  
  def activate!
    self.active = true
    self.save!
  end
  
  #private
  
  def give_company_principals_property_owner_role
    property_owner_role_id =  Role.find_by_name('property_owner').id
    company.members.each do |user|
      if user.role_for_context(company).name == "company_principal"
        Membership.find_or_create_by_user_id_and_context_id_and_role_id_and_context_type(
          user.id,
          self.id,
          property_owner_role_id,
          self.class.to_s
        )
      end
    end
  end
end
