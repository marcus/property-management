class Admin::AttachmentsController < ApplicationController
  layout 'admin/layouts/layout'
  before_filter :authorize
  before_filter :find_property_attachment
  
  def index
    if params[:property_id]
      @attachments = Attachment.find_all_by_property_id(params[:property_id])

      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @attachments }
      end
    
    else
      redirect_to '/'
    end
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @attachment }
    end
  end

  def new
    @attachment = Attachment.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @attachment }
    end
  end

  def edit
    @attachment = Attachment.find(params[:id])
  end

  def create
    @attachment = Attachment.new(params[:attachment])
    @attachment.property_id = @property.id
    respond_to do |format|
      if @attachment.save
        flash[:notice] = "You've successfully added an attachment to this property"
        format.html { redirect_to(admin_property_attachment_path(@property, @attachment)) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    respond_to do |format|
      if @attachment.update_attributes(params[:attachment])
        flash[:notice] = 'Attachment was successfully updated.'
        format.html { redirect_to(admin_property_attachment_path(@property, @attachment)) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @attachment.destroy

    respond_to do |format|
      format.html { redirect_to(admin_property_attachments_url(@property)) }
    end
  end
  
  private
  
  def find_property_attachment
    @property = Property.find(params[:property_id]) if params[:property_id]
    @attachment = Attachment.find(params[:id]) if params[:id]
  end
  
  def check_permissions
    if !can? :manage_property
      redirect_to "/"
    end
  end
end
