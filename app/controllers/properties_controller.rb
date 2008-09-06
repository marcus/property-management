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

  def new
    @property = Property.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @property }
    end
  end

  def edit
  end

  def create
    @property = Property.new(params[:property])
    @property.company_id = current_company.id
    
    respond_to do |format|
      if @property.save
        flash[:notice] = 'Property was successfully created.'
        format.html { redirect_to(@property) }
        format.xml  { render :xml => @property, :status => :created, :location => @property }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @property.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @property = current_company.properties.find(params[:id])

    respond_to do |format|
      if @property.update_attributes(params[:property])
        flash[:notice] = 'Property was successfully updated.'
        format.html { redirect_to(@property) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @property.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @property.destroy

    respond_to do |format|
      format.html { redirect_to(properties_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  def find_property
    @property = current_company.properties.active.find(params[:id], :include => ['property_photos', 'attachments']) if params[:id]
  end
end
