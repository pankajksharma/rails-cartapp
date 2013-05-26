class SessionsController < ApplicationController

  def create
  	user = User.find_by_email(params[:email])
  	if user and user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to admin_url
  	else
  		redirect_to login_url, alert: 'Invalid email or password.'
  	end 
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to store_url, notice: 'Logged Out.'
  end
end
