class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :set_locale
  
  private
  
  def set_locale
    redirect_to root_path(locale: params[:change_locale]) if params[:change_locale]
    extract_locale = params[:locale].present? && I18n.available_locales.include?(params[:locale].to_sym) && params[:locale].to_sym || I18n.default_locale
    I18n.locale = extract_locale || I18n.default_locale
  end
end
