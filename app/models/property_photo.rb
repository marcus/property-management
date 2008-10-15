class PropertyPhoto < ActiveRecord::Base
  belongs_to :property
  
  has_attached_file :photo,
                    :styles => { :large => ["800x600>", :jpg], :medium => ["300x225#", :jpg], :small => ["220x160#", :jpg], :thumbnail => ["70x70#", :jpg]},
                    :default_style => :medium,
                    :path => ":rails_root/public/photos/:id/:style/:basename.:extension",
                    :url => "/photos/:id/:style/:basename.:extension"#, 
                    #:default_url => "/:class/:photos/missing_:style.png",
  named_scope :featured, :conditions => {:featured => true}
  named_scope :first_two, :limit => 2
  named_scope :secondary, lambda{ |offset| { :limit => "#{offset || 2}, 10000" }  }
  #SELECT * FROM property_photos WHERE (property_photos.property_id = 1) ORDER BY position limit 2,10000;
  acts_as_list :scope => :property
  
  def description
    if super.blank?
      name
    else
      super
    end
  end
end