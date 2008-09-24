# index show new create edit update destroy
class Admin::CompaniesController < ApplicationController
  before_filter :authorize
  before_filter :get_current_company#, :except => [:create]
  layout 'admin/layouts/layout'
  
  def index
    
  end
  
  def show
  end
  
  def new
    @company = Company.new

    respond_to do |format|
      format.html
    end
  end
  
  def create
    @company = Company.new(params[:company])

    respond_to do |format|
      if @company.save
        flash[:notice] = 'Company was successfully saved.'
        format.html { render :action => "show" }
      else
        format.html { render :action => "new" }
      end
    end
    
  end
  
  def edit
  end
  
  def update
    respond_to do |format|
      if @company.update_attributes(params[:company])
        flash[:notice] = 'Company was successfully updated.'
        format.html { render :action => "show" }
      else
        format.html { render :action => "edit" }
      end
    end
  end
  
  private
  
  def get_current_company
    @company = current_company
  end
end

