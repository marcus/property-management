class PropertiesController < ApplicationController
  # index show new edit create udpate destroy
  before_filter :find_property, :except => ['index']
  
  def index
    # Active properties (TODO give the model scope)
    @properties = current_company.properties.find(:all, :include => ['property_photos'])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @properties }
    end
  end

  def show
    #@property = Property.find(params[:id], :include => ['events', 'attachments'])

    # Events for list 
    if !params[:day]
      @events_list = @property.events.in_range(Event.month_boundaries(DateTime.now))
    else
      @date = params[:day].to_datetime
      @events_list = @property.events.for_date(params[:day])
    end
    
    # Events for calendar
    @events = @property.events.in_range(Event.month_boundaries(DateTime.now))
    respond_to do |format|
      format.html # index.html.erb
    end

  end
 
  private
  def find_property
    @property = current_company.properties.active.find(params[:id], :include => ['property_photos', 'attachments']) if params[:id]
  end
end
