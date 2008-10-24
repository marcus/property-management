class Admin::MembershipsController < ApplicationController
  layout 'admin/layouts/layout'
  before_filter :find_membership
  before_filter :authorize
  
  def index
    @property = Property.find(params[:property_id])
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
  

  private
  def find_membership
    @membership = Membership.find(params[:id]) if params[:id]
  end
end