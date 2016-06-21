class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_user
  helper_method :current_user, :logged_in?, :get_yoda_speak
  attr_reader :app_user, :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def set_user
    @app_user = current_user
  end

  def get_yoda_speak(sentence)
    yoda = YodaService.new
    yoda.speak(sentence)
  end

end
