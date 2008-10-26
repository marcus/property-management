class Admin::UsersController < ApplicationController
  layout 'admin/layouts/layout'
  before_filter :find_user, :verify_permissions

  def index
    @users = current_company.members
  end
  
  def edit
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      # TODO error checking here... probably not the best way to handle this.
      Membership.new(:user_id => @user.id, 
               :context_id => current_company.id,
               :context_type => current_company.class.to_s, 
               :role_id => Role.find_by_name('company_partner').id).save
               
      flash[:notice] = "User was successfully created"
      redirect_to admin_users_url
    else
      render :action => "new"
    end
  end
  
  def update
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
  
  def destroy
    @user.status = false
    @user.save
    redirect_to admin_users_url
  end

  private
  def find_user
    @user = User.find(params[:id]) if params[:id]
  end
  
  def verify_permissions
    if !@user.blank? && !current_user.anonymous?
      authorize unless @user.id == current_user.id
    else
      authorize
    end
      
  end
end