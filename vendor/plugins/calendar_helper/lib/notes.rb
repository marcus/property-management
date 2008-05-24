#http://rubyonrailsworkshops.com/dashboard/2008/4

Model:
def starts_on
  Date.civil(self.starts_at.year, self.starts_at.month, self.starts_at.day)
end
 
def ends_on
  Date.civil(self.ends_at.year, self.ends_at.month, self.ends_at.day)
end

Migration:
class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.column :name, :string
      t.column :description, :text
      t.column :starts_at, :datetime
      t.column :ends_at, :datetime
    end
  end

  def self.down
    drop_table :events
  end
end

View:
<%= 
	calendar(:year => Date.today.year, :month => Date.today.month) do |d|
	  cell_text = "#{d.mday}<br />" 
	  cell_attrs = {:class => 'day'}
	  @events.each do |e|
	    if e.starts_on == d || ( e.starts_on <= d && e.ends_on >= d ) 
	      cell_attrs[:class] = 'specialDay'
	    end
	  end
	  [cell_text, cell_attrs]
	end
%>