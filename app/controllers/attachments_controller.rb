class AttachmentsController < ApplicationController
  layout 'admin/layouts/layout'
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

  # GET /attachments/1
  # GET /attachments/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @attachment }
    end
  end

  # GET /attachments/new
  # GET /attachments/new.xml
  def new
    @attachment = Attachment.new
    @properties = Property.find(:all)
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @attachment }
    end
  end

  # GET /attachments/1/edit
  def edit
    @attachment = Attachment.find(params[:id])
    @properties = Property.find(:all)
  end

  # POST /attachments
  # POST /attachments.xml
  def create
    respond_to do |format|
      if @attachment.save
        notice = "You've successfully added an attachment to this property"
        if params[:featured] == "true"
          if @attachment.attached_content_type.include?("image")
            @attachment.move_to_top
          else
            notice += ", but the attachment was not featured - only images can be featured!"
          end
        end
        
        flash[:notice] = notice
        format.html { redirect_to(@attachment) }
        format.xml  { render :xml => @attachment, :status => :created, :location => @attachment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @attachment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /attachments/1
  # PUT /attachments/1.xml
  def update
    respond_to do |format|
      if @attachment.update_attributes(params[:attachment])
        flash[:notice] = 'Attachment was successfully updated.'
        format.html { redirect_to(@attachment) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @attachment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /attachments/1
  # DELETE /attachments/1.xml
  def destroy
    @attachment.destroy

    respond_to do |format|
      format.html { redirect_to(attachments_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def find_property_attachment
    @property = Property.find(params[:property_id]) if params[:property_id]
    @attachment = Attachment.find(params[:id]) if params[:attachment]
  end
end
