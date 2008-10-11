class Admin::EventsController < ApplicationController
  layout 'admin/layouts/layout'
  before_filter :authorize
  before_filter :find_property_event
  
  def index
    if @property
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
            
    else
      redirect_to '/'
    end
  end

  def update_calendar
    @events = @property.events.in_range(Event.month_boundaries(Date.today + params[:new_month].to_i.months))
    
    render( :update ){|page| 
      page.replace_html "calendar_display", :partial => "/events/calendar", :locals => { :month => params[:new_month].to_i, :events => @events }
      page.replace_html "events_list", :partial => "/events/list", :locals => { :events_list => @events }
    }
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event }
    end
  end

  def new
    @event = Event.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event }
    end
  end

  def edit
  end

  def create
    @event = Event.new(params[:event])
    @event.property_id = @property.id
    @event.event_type ||= "occupancy"
    @event.owner_id ||= current_user.id
    
    respond_to do |format|
      if @event.save
        flash[:notice] = 'Event was successfully created.'
        format.html { redirect_to(admin_property_event_path(@property, @event)) }
        format.xml  { render :xml => @event, :status => :created, :location => @event }
      else
        flash[:notice] = 'There was a problem saving the event'
        format.html { render :action => "new" }
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update_attributes(params[:event])
        flash[:notice] = 'Event was successfully updated.'
        format.html { redirect_to(admin_property_event_path(@property, @event)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @event.destroy

    respond_to do |format|
      format.html { redirect_to(admin_property_path(@property)) }
    end
  end
  
  private
  def find_property_event
    @event = Event.find(params[:id]) if params[:id]
    @property = Property.find(params[:property_id]) if params[:property_id]
  end
end
