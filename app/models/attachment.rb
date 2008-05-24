class Attachment < ActiveRecord::Base
  # TODO - Add separate upload locations for gallery images and other attachments.
  
  belongs_to :property
  has_attached_file :attached,
                    :styles => { :large => ["800x600>"], :medium => ["300x225#", :jpg], :small => ["220x160#", :jpg], :thumbnail => ["70x70#", :jpg]},
                    :default_style => :medium, 
                    :default_url => "/:class/:attachment/missing_:style.png",
                    :path => ":rails_root/public/properties/:id/:style/:basename.:extension",
                    :url => "/properties/:id/:style/:basename.:extension"
  named_scope :featured, :conditions => {:featured => true}
  acts_as_list :scope => :property
  
  private
end