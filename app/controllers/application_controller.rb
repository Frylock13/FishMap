class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :get_custom_page_slugs
  before_action :get_banners
  before_action :set_session_variables

  def get_current_coordinates
    @latitude  = request.location.latitude
    @longitude = request.location.longitude
  end

  def get_custom_page_slugs
    @custom_pages = Page.active
  end

  def get_banners
    @all_banners = Banner.active
  end

  def set_session_variables
    session[:likes] ||= []
    session[:dislikes] ||= []
    session[:reviewed] ||= []
  end
end