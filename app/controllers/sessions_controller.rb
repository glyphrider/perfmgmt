class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:create]

  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_login(auth[:provider], auth[:extra][:raw_info][:login])
    if user
      user.name = auth[:info][:name]
      user.save
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Signed in!"
    else
      session[:user_id] = nil
      redirect_to root_url, :notice => "Signed out!"
    end
  end
 
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end
 
end
