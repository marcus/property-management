class Admin::MembershipsController < ApplicationController
  layout 'admin/layouts/layout'
  before_filter :find_membership
  before_filter :authorize
  
  def index
  end
  
  def create
    @membership = Membership.new(params[:membership])
    @membership.context_id = @property.id
    @membership.context_type = @property.class.to_s
    
    respond_to do |format|
      format.html {
        if @membership.save
          flash[:notice] = "Member added to property."
        else
          flash[:notice] = "There was a problem adding the member."
        end
      }
      redirect_to admin_property_memberships_path(@property)
    end
  end
  
  def update
    respond_to do |format|
      format.js { 
        if @membership.update_attributes(params[:membership])
          message = "Update successful."
        else
          message = "Update failed."
        end
        render(:update){ |page| 
          page.replace_html "member_#{params[:membership][:user_id]}",
                            :partial => 'membership_form',
                            :locals => { :member => @membership.user,
                                         :property => @membership.context,
                                         :message => message }
        }
      }
    end
  end
  
  def destroy
    @membership.destroy unless @membership.user_id == current_user.id
    redirect_to admin_property_memberships_path(@property)
  end

  private
  def find_membership
    @property = Property.find(params[:property_id]) if params[:property_id]
    @membership = Membership.find(params[:id]) if params[:id]
  end
end