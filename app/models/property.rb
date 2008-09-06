class Property < ActiveRecord::Base
  named_scope :active, :conditions => {:active => true}
  named_scope :inactive, :conditions => {:active => false}

  belongs_to :company
  has_many :members, :through => :memberships, :source => :user
  has_many :attachments, :order => "position", :dependent => :destroy
  has_many :property_photos, :order => "position", :dependent => :destroy
  has_many :events, :dependent => :destroy
  
  validates_presence_of :company_id, :name
  
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
end
