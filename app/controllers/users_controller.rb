require 'color_generator'

class UsersController < ApplicationController
  before_filter :authorize
  
  def new
    # Can't create a new acct if you're already logged in
    # Since we're authorizing, that means no new users can be created from here...
    if !current_user.anonymous?
      redirect_back_or_default('/')
    end
  end

  def create
    cookies.delete :auth_token
    # protects against session fixation attacks, wreaks havoc with 
    # request forgery protection.
    # uncomment at your own risk
    # reset_session
    @user = User.new(params[:user])
    @user.color = random_color
    @user.save
    if @user.errors.empty?
      self.current_user = @user
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!"
    else
      render :action => 'new'
    end
  end

end