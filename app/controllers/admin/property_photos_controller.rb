class Admin::PropertyPhotosController < ApplicationController
  before_filter :find_property_photo
  before_filter :authorize

  layout 'admin/layouts/layout'

  def index
    @property_photos = @property.property_photos
  end
  
  def new
    @property_photo = PropertyPhoto.new
  end
  
  def edit
  end
  
  def update
    respond_to do |format|
      if @property_photo.update_attributes(params[:property_photo])
        flash[:notice] = "Photo was updated successfully"
        format.html { render :action => 'index'}
      else
        flash[:notice] = "There was an error updating this photo"
        format.html { redirect_to url_for :controller => 'properties', :action => 'show', :id => @property.id }
      end
    end
  end
  
  def create
    @property_photo = PropertyPhoto.new(params[:property_photo])
    @property_photo.property_id = params[:property_id]
    
    respond_to do |format|
      if @property_photo.save
        # TODO - only allow photos to be uploaded
        flash[:notice] = "You've successfully added a photo to this property"
        format.html { redirect_to admin_property_property_photos_url @property }
      else
        #format.html { render :action => "new" }
      end
    end
  end

  def destroy
    @property_photo.destroy

    respond_to do |format|
      flash[:notice] = "Photo was successfully deleted."
      format.html { redirect_to admin_property_property_photos_url @property }
      format.xml  { head :ok }
    end
  end

  private
  def find_property_photo
    @property = Property.find(params[:property_id]) if params[:property_id]
    @property_photo = PropertyPhoto.find(params[:id]) if params[:id]
  end
end