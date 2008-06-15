class Admin::PropertiesController < ApplicationController
  # index show new edit create udpate destroy
  before_filter :get_user
  before_filter :get_context
  before_filter :get_property, :only => [:update, :destroy ]
  before_filter :authorize

  def index
    # TODO How do I make sure an admin sees *all* properties in the business; 
    # are they automatically added as a member when the property is created?
    if current_user.admin?
      @properties = current_company.properties
    else
      @properties = current_user.properties
    end
  end

  def show
    @property = Property.find(params[:id], :include => ['events', 'attachments'])
    @events = @property.events
  end

  def new
    @property = Property.new
  end

  def edit
    @property = Property.find(params[:id])
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
    @property = Property.find(params[:id])

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

  # DELETE /properties/1
  # DELETE /properties/1.xml
  def destroy
    @property = Property.find(params[:id])
    @property.destroy

    respond_to do |format|
      format.html { redirect_to(properties_url) }
    end
  end
  
  private
  def get_user
    if logged_in?
      @user = current_user
    end
  end
  
  def get_property
    @property = Property.find(params[:id])
  end
  
  def get_context
    @company = current_company
  end
end
