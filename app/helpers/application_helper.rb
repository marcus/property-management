# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def can?(permission, con = nil)
    if con.blank? : con = current_company
    else con = @property
    end

    current_user.allowed_to? permission, con
  end
  
  def event_types
    ["occupancy", "other"]
  end
  
  def calendar_with_events(c_events, increase=0)
    mo = get_month(increase)
    ye = Date.today.year + ((Date.today.month+increase-1)/12)

    calendar(:year => ye, :month => mo) do |d|
      cell_text = "#{d.mday}<br />" 
      cell_attrs = {:class => 'day'}
      c_events.each do |e|
        if e.starts_at == d || ( e.starts_at.to_date <= d && e.ends_at.to_date >= d ) 
          cell_attrs[:class] = 'specialDay'
          cell_text = link_to(d.day, events_url(:day => d))
        end
      end
      [cell_text, cell_attrs]
    end
  end

  def get_month(increase)
      month = Date.today.month+increase
      if month > 12
        new_increase = increase-12
        get_month(new_increase)
      else
        month
      end
  end
end
