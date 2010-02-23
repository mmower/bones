# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  before_filter :setup_week
  attr_accessor :week
  
  def setup_week
    @week = if params[:week_id]
      begins = Date.parse( params[:week_id] )
      Week.find( :first, :conditions => ['begins = ?', Date.parse( params[:week_id] )] )
    end
  end
  
end
