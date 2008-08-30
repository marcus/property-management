class EventsController < ApplicationController
  layout 'admin/layouts/layout'
  before_filter :find_property_event
  def index
    if @property
      @events = Event.find_all_by_property_id(@property.id)

      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @events }
      end
      
    else
      redirect_to '/'
    end
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event }
    end
  end

  def new
    all_properties
    @event = Event.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event }
    end
  end

  def edit
    all_properties
  end

  def create
    @event = Event.new(params[:event])
    respond_to do |format|
      if @event.save
        flash[:notice] = 'Event was successfully created.'
        format.html { redirect_to(@event) }
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
        format.html { redirect_to(@event) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @event.destroy

    respond_to do |format|
      format.html { redirect_to(events_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  def find_property_event
    @event = Event.find(params[:id]) if params[:id]
    @property = Property.find(params[:property_id]) if params[:property_id]
  end
  
  def all_properties
    @properties = Property.find(:all)
  end
end
