class PropertyPhoto < ActiveRecord::Base
  belongs_to :property
  
  has_attached_file :photo,
                    :styles => { :large => ["800x600>"], :medium => ["300x225#", :jpg], :small => ["220x160#", :jpg], :thumbnail => ["70x70#", :jpg]},
                    :default_style => :medium, 
                    :default_url => "/:class/:attachment/missing_:style.png",
                    :path => ":rails_root/public/photos/:id/:style/:basename.:extension",
                    :url => "/photos/:id/:style/:basename.:extension"
  named_scope :featured, :conditions => {:featured => true}
  acts_as_list :scope => :property
end
