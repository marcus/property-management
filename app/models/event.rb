class Event < ActiveRecord::Base
  belongs_to :property
  
  def starts_on
    Date.civil(self.starts_at.year, self.starts_at.month, self.starts_at.day)
  end

  def ends_on
    Date.civil(self.ends_at.year, self.ends_at.month, self.ends_at.day)
  end
  
end
