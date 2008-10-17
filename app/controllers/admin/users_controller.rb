class Admin::UsersController < ApplicationController
  layout 'admin/layouts/layout'
  before_filter :find_user, :verify_permissions

  def index
    @users = (current_company.properties.map{|p|p.members}).flatten.uniq
  end
  
  def edit
  end
  
  def update
    logger.debug { "USER + +++++ #{@user.id}" }
    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'User was successfully updated.'
        format.html { 
          if @user.id != current_user.id
            redirect_to(admin_users_url)
          else
            redirect_to(edit_admin_user_url(@user))
          end
        }
        format.xml  { head :ok }
      else
        flash[:notice] = 'There was an error updating this user'
        format.html { redirect_to edit_admin_user_url(@user) }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  private
  def find_user
    @user = User.find(params[:id]) if params[:id]
  end
  
  def verify_permissions
    logger.debug { "ONE" }
    if !@user.blank? && !current_user.anonymous?
      logger.debug { "TWO" }
      authorize unless @user.id == current_user.id
    else
      logger.debug { "THREE" }
      authorize
    end
      
  end
end