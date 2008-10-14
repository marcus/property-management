class Admin::PropertiesController < ApplicationController
  # index show new edit create udpate destroy
  before_filter :get_property
  before_filter :authorize
  layout 'admin/layouts/layout'

  def index
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
        format.html { redirect_to(admin_property_path @property) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @property = Property.find(params[:id])

    respond_to do |format|
      if @property.update_attributes(params[:property])
        flash[:notice] = 'Property was successfully updated.'
        format.html { redirect_to(admin_property_path @property) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @property = Property.find(params[:id])
    @property.destroy

    respond_to do |format|
      format.html { redirect_to(properties_url) }
    end
  end
  
  private
  
  def get_property
    @property = Property.find(params[:id]) if params[:id]
  end

end
