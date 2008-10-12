class Attachment < ActiveRecord::Base  
  belongs_to :property
  has_attached_file :attached,
                    #:styles => { :large => ["800x600>"], :medium => ["300x225#", :jpg], :small => ["220x160#", :jpg], :thumbnail => ["70x70#", :jpg]},
                    :styles => {}, # Attachments aren't resized etc.
                    :default_style => :original, 
                    :default_url => "/:class/:attachment/missing_:style.png",
                    :path => ":rails_root/public/attachments/:id/:style/:basename.:extension",
                    :url => "/attachments/:id/:style/:basename.:extension"
  acts_as_list :scope => :property
end