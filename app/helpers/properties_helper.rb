module PropertiesHelper

  def calendar_with_events(increase=0)
    mo = get_month(increase)
    ye = Date.today.year + ((Date.today.month+increase-1)/12)
    
    calendar(:year => ye, :month => mo) do |d|
      cell_text = "#{d.mday}<br />" 
      cell_attrs = {:class => 'day'}
      @events.each do |e|
        if e.starts_on == d || ( e.starts_on <= d && e.ends_on >= d ) 
          cell_attrs[:class] = 'specialDay'
          cell_attrs[:onmouseover] = "Element.update('day_detail', '#{d.mday} - #{e.description}')"
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
