class Property < ActiveRecord::Base
  has_many :attachments, :order => "position", :dependent => :destroy
  has_many :events, :dependent => :destroy
  belongs_to :company
  
  validates_presence_of     :company_id, :name
  
  def featured_image
    self.attachments.find(:first)#, :conditions => "attached_content_type")
    #TODO - check to see if the first attachment is an image. If not, move the first image up in the list
  end
end
