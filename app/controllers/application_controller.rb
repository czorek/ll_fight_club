class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  layout "application"

  before_action :authenticate_user!
  before_action :set_locale

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def preselected_fighter
    @preselected_fighter ||= current_user.fighters.find(params[:selected_fighter]) if params[:selected_fighter]
  end
end
