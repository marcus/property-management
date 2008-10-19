class Admin::MembersController < ApplicationController
  layout 'admin/layouts/layout'
  before_filter :find_members
  
  def index
  end
  

  private
  def find_members
    @property = Property.find(params[:property_id]) if params[:property_id]
  end
end