class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :global_site_settings, :objects
  include Optimadmin::AdminSessionsHelper
  helper_method :current_administrator

  unless Rails.application.config.consider_all_requests_local
    rescue_from Exception, with: -> { render_error(500) }
    rescue_from ActiveRecord::RecordNotFound, with: -> { render_error(404) }
    rescue_from ActionController::RoutingError, with: -> { render_error(404) }
  end

  def render_error(status)
    respond_to do |format|
      format.html { render 'errors/404', status: status }
      format.all { render nothing: true, status: status }
    end
  end

  def index
    @home_page_item = HomePageItem.displayed
    @banner_text = @additional_contents.find_by(area: 'banner_text')
    @banner_button = @buttons.find_by(area: 'banner')
  end

  private

  def global_site_settings
    @global_site_settings ||= Optimadmin::SiteSetting.current_environment
  end
  helper_method :global_site_settings

  def objects
    @additional_contents = AdditionalContent.displayed
    @buttons = Button.displayed
    @sidebar_item_1 = @buttons.find_by(area: 'sidebar_item_1')
    @sidebar_item_2 = @buttons.find_by(area: 'sidebar_item_2')
    @opening_hours = @additional_contents.find_by(area: 'opening_hours')
    @header_menu = Optimadmin::Menu.new(name: 'header')
  end
end
