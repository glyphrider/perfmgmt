class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:create, :new, :index]

  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_github_id(auth[:extra][:raw_info][:login])
    if user
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Signed in!"
    else
      session[:user_id] = nil
      redirect_to root_url, :notice => "Signed out!"
    end
  end

  def new
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end

  def index
  end
 
end
