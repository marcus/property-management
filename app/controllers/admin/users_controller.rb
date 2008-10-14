class Admin::UsersController < ApplicationController
  layout 'admin/layouts/layout'
  before_filter :authorize, :find_user

  def index
    @users = (current_company.properties.map{|p|p.members}).flatten.uniq
  end

  private
  def find_user
    @user = User.find(params[:id]) if params[:id]
  end
end