class Company < ActiveRecord::Base
  has_attached_file :logo, 
                    :styles => { :medium => "220x80>", :small => "110x40>" },
                    :default_style => :medium,
                    :path => ":rails_root/public/companies/:id/:style/:basename.:extension",
                    :url => "/companies/:id/:style/:basename.:extension"
end