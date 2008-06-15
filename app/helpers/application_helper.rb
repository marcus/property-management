# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def can?(permission, con = nil)
    if con.blank? : con = current_company
    else con = @property
    end

    current_user.allowed_to? permission, con
  end
end
