class PropertiesController < ApplicationController
  def index
    @properties = current_company.properties.active
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @properties }
    end
  end

  def show
    @property = current_company.properties.active.find( params[:id],
                :include => [:property_photos, :attachments] )

    if !@property.location.blank?
      @map = GMap.new("map_div")

      results = Geocoding::get(@property.location)
      if results.status == Geocoding::GEO_SUCCESS
        coord = results[0].latlon
        @map.overlay_init(GMarker.new(coord,:info_window => @property.location))
      end

    end

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
end
