class AdminController < ApplicationController
	before_filter :authorize
  def index
  	@total_orders = Order.count
  	@admin_name = User.find_by_id(session[:user_id]).name
  end
end
