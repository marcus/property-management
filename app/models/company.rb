class Company < ActiveRecord::Base
  named_scope :active, :conditions => {:active => true}
  named_scope :inactive, :conditions => {:active => false}
  
  has_many :properties
  has_many :pages
  has_many :members, :through => :memberships, :source => :user

  has_attached_file :logo, 
                    :styles => { :medium => "220x80>", :small => "110x40>" },
                    :default_style => :medium,
                    :path => ":rails_root/public/companies/:id/:style/:basename.:extension",
                    :url => "/companies/:id/:style/:basename.:extension"
                    
  def deactivate!
    self.active = false
    self.save!
  end

  def activate!
    self.active = true
    self.save!
  end
end