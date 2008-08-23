class EventsController < ApplicationController
  def index
    if params[:property_id]
      @events = Event.find_all_by_property_id(params[:property_id])

      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @events }
      end
      
    else
      redirect_to '/'
    end
  end

  def show
    @event = Event.find(params[:id])

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
    @event = Event.find(params[:id])
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
    @event = Event.find(params[:id])

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
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to(events_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  def find_event
    @event = Event.find(params[:id]) if params[:id]
    @property = Property.find(params[:id]) if params[:property_id]
  end
  
  def all_properties
    @properties = Property.find(:all)
  end
end
