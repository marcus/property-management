# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def can?(permission, con = nil)
    if con.blank?  
      if !@property.blank? : con = @property
      elsif !@company.blank? : con = @company
      elsif !@context.blank? : con = @context
      end
    end
    
    current_user.allowed_to? permission, con
  end
end
