class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_locale

  def after_sign_in_path_for(resource)
    resource.admin? ? admin_tests_path : super
  end

  def default_url_options
    return { lang: I18n.locale } unless I18n.locale == I18n.default_locale
    super
  end

  private

  def set_locale
    I18n.locale =
      I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
end
