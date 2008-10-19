class Event < ActiveRecord::Base
  belongs_to :property
  belongs_to :owner, :class_name => "User", :foreign_key => :owner_id
  validates_presence_of :owner_id, :on => :create, :message => "Events must have an owner"
  validates_presence_of :property_id, :on => :create, :message => "Events must be associated with a property"
  named_scope :in_range, lambda { |range| 
    start = range[0].to_date.to_time
    finish = range[1].to_date.to_time + 1.day - 1.second
    { :conditions => ['(starts_at >= ? AND starts_at<= ?) OR (ends_at <= ? AND ends_at >= ?)', start, finish, finish, start],
      :include => :owner,  }
  }
  
  # Events that begin, end or span a given date, accepts Time or Date objects
  named_scope :for_date, lambda { |date|
    end_time = date.to_date.to_time
    begin_time = date.to_date.to_time + 1.day - 1.second
    { :conditions => ['starts_at <= ? AND ends_at >= ?', begin_time, end_time] }
  }
  
  def starts_on
    Date.civil(self.starts_at.year, self.starts_at.month, self.starts_at.day)
  end

  def ends_on
    Date.civil(self.ends_at.year, self.ends_at.month, self.ends_at.day)
  end
  
  class << self
    # Events that begin, end or span a given date, accepts Time or Date objects
    def events_for_date(date)
      # Convert date to midnight of the previous day and midnight of that day
      end_time = date.to_date.to_time
      begin_time = date.to_date.to_time + 1.day - 1.second
    
      Event.find(:all, :conditions => ['starts_at <= ? AND ends_at >= ?', begin_time, end_time])
    end
  
    def month_boundaries(date)
      begin_day = date - (date.day-1).days
      end_day = begin_day + (Date.civil(begin_day.year, begin_day.month, -1).day)
      [begin_day, end_day]
    end
  end
  
  
end
