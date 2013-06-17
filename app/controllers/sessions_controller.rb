require 'omniauth'
require 'omniauth-github'
class SessionsController < ApplicationController

  def new
    redirect_to '/auth/twitter'
  end


  def create
    user = User.where(:provider => auth['provider'],
                      :uid => auth['uid'].to_s).first || User.create_with_omniauth(auth)
# Reset the session after successful login, per
# 2.8 Session Fixation – Countermeasures:
# http://guides.rubyonrails.org/security.html#session-fixation-countermeasures
    reset_session
    session[:user_id] = user.id
    if user.email.blank?
      redirect_to edit_user_path(user), :alert => "Please enter your email address."
    else
      redirect_to root_url, :notice => 'Signed in!'
    end

  end

  def destroy
    reset_session
    redirect_to root_url, :notice => 'Signed out!'
  end

  def failure
    redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
  end

  #def create
  #  @user = User.find_or_create_from_auth_hash(auth_hash)
  #  self.current_user = @user
  #  redirect_to '/'
  #end

  protected

  def auth
    request.env['omniauth.auth']
  end

end
